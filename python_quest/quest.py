import os

logs = ["INFO: Service started",
        "ERROR: Connection timeout",
        "WARNING: CPU usage high",
        "INFO: Health check passed",
        "ERROR: Out of memory"
        ]
error_count = sum(1 for log in logs if "ERROR" in log)

if error_count > 2:
    print("Fix prod")
else:
    print("All ok")

cpu_usage = [35, 55, 78, 90, 67, 120, 15]

for usage in cpu_usage:
    if usage > 100:
        print(f"{usage}% uncarrect")
    elif usage > 80:
        print(f"{usage}% warning")
    else:
        print("Normal")

servers = [
    ("web-1", "online"),
    ("web-2", "offline"),
    ("db-1", "offline"),
    ("cache", "offline"),
    ("cache-1", "offline")
]

offline_names = [name for name, status in servers if status == "offline"]
count = len(offline_names)

if count > 2:
    print(f" WARNING: {count} servers are down!")
    print(f"List of offline servers: {', '.join(offline_names)}")
elif count > 0:
    print(f"Notice: {count} server(s) offline. Stable for now.")
else:
    print("All systems online")

#Не успел написать коммs
