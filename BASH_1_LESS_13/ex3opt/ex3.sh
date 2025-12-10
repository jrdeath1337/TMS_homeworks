#!/usr/bin/bash

grep -o -E '[a-zA-Z0-9.,+\-]+@[a-zA-Z0-9.\-]+' "$@" | awk '
{
    email = $0
    if (email ~ /\.\./) next
    if (email ~ /@.*@/) next
    
    split(email, parts, "@")
    if (length(parts) != 2) next
    
    local = parts[1]
    domain = parts[2]
    
    if (length(local) > 64 || length(domain) > 255) next
    if (local ~ /^[.,+\-]/ || local ~ /[.,+\-]$/) next
    if (domain ~ /^[.,\-]/ || domain ~ /[.,\-]$/) next
    if (local ~ /[^a-zA-Z0-9.,+\-]/) next
    if (domain ~ /[^a-zA-Z0-9.\-]/) next
    
    print email
}' | sort -u
