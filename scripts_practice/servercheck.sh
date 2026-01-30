#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found" >&2
    exit 1
fi

# Создаем временные файлы
TEMP_DIR=$(mktemp -d)
REQUESTS_FILE="$TEMP_DIR/requests"
TRAFFIC_FILE="$TEMP_DIR/traffic"
CODES_FILE="$TEMP_DIR/codes"

# Обрабатываем файл
skipped=0

while IFS= read -r line || [[ -n "$line" ]]; do
    # Пропускаем пустые строки
    [[ -z "$line" ]] && continue
    
    # Извлекаем IP (первое слово)
    ip=$(echo "$line" | awk '{print $1}')
    
    # Извлекаем код ответа (последнее поле перед последним)
    code=$(echo "$line" | awk '{print $(NF-1)}')
    
    # Извлекаем размер (последнее поле)
    size=$(echo "$line" | awk '{print $NF}')
    
    # Проверяем валидность
    if [[ ! "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] || 
       [[ ! "$code" =~ ^[0-9]+$ ]] || 
       [[ ! "$size" =~ ^[0-9]+$ ]]; then
        ((skipped++))
        continue
    fi
    
    # Записываем данные
    echo "$ip" >> "$REQUESTS_FILE"
    echo "$ip $size" >> "$TRAFFIC_FILE"
    echo "$ip $code" >> "$CODES_FILE"
done < "$LOG_FILE"

if [[ $skipped -gt 0 ]]; then
    echo "WARNING: Skipped $skipped malformed lines" >&2
fi

# Получаем список IP и количество запросов
if [[ ! -f "$REQUESTS_FILE" ]]; then
    echo "No valid log entries found"
    rm -rf "$TEMP_DIR"
    exit 0
fi

# Сортируем IP по количеству запросов
sort "$REQUESTS_FILE" | uniq -c | sort -rn | head -10 | while read count ip; do
    # Получаем трафик для этого IP
    traffic=$(awk -v ip="$ip" '$1 == ip {sum += $2} END {print sum}' "$TRAFFIC_FILE" 2>/dev/null || echo "0")
    
    # Получаем уникальные коды для этого IP
    codes=$(awk -v ip="$ip" '$1 == ip {print $2}' "$CODES_FILE" 2>/dev/null | sort -n | uniq | tr '\n' ',' | sed 's/,$//')
    
    echo "IP: $ip"
    echo "  Requests: $count"
    echo "  Codes: [$codes]"
    echo "  Traffic: ${traffic} bytes"
    echo
done

# Удаляем временные файлы
rm -rf "$TEMP_DIR"
