## Sync-Skript – Lokales Verzeichnis mit S3 synchronisieren

1. AWS CLI konfigurieren:
   aws configure
2. Skript erstellen, z. B. sync.sh:
```
   #!/bin/bash
   LOCAL_DIR="/pfad/zum/ordner"
   BUCKET_NAME="s3://mein-bucket-name"

   aws s3 sync "$LOCAL_DIR" "$BUCKET_NAME"
```
3. Skript ausführbar machen:
   chmod +x sync.sh
4. Skript ausführen:
   ./sync.sh
5. Überprüfen:
   - S3-Bucket öffnen → Dateien müssen identisch sein
