from pathlib import Path
import os

source_dir = Path(input("Путь к директории с логами: "))
backup_dir = Path(input("Путь к директории для бэкапов: "))

if source_dir.is_dir():
    logs = list(source_dir.glob("*.log"))
    count = len(logs)

    if count > 0:
        backup_dir.mkdir(parents=True, exist_ok=True)
        
        archive_path = backup_dir / "logs_$(date +%Y%m%d_%H%M%S).tar.gz"
        
        print(f"Найдено логов: {count}")
        
        os.system(f"tar -czvf {archive_path} -C {source_dir} .")
        
        print(f"Успешно заархивировано файлов: {count}")
        print(f"Архив сохранен в: {backup_dir}")
    else:
        print("Файлы .log не найдены.")
else:
    print("Исходная директория не найдена.")
