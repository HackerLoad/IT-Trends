# 🟦 AWS Aufgaben — Komplettübersicht

---

## 📥 1. Datei per Kommandozeile aus einem S3-Bucket herunterladen

Mit der AWS CLI:

```bash
aws s3 cp "s3://<BUCKETNAME>/<DATEINAME>" .
```

Beispiel:

```bash
aws s3 cp "s3://dhge-kasche-klausur-wi24/AWS_S3_Erfolg.pdf" .
```

---

## 📝 2. Skript, das zwei Parameter annimmt (Bucket + Datei) und die Datei in Downloads speichert

### PowerShell Variante (`download.ps1`)

```powershell
param(
    [string]$bucket,
    [string]$filename
)

$downloadPath = "$env:USERPROFILE\Downloads"

aws s3 cp "s3://$bucket/$filename" "$downloadPath"

Write-Host "Datei wurde heruntergeladen nach $downloadPath"
```

Aufruf:

```powershell
.\download.ps1 dhge-kasche-klausur-wi24 AWS_S3_Erfolg.pdf
```

---

### Bash Variante (`download.sh`)

```bash
#!/bin/bash

bucket=$1
file=$2
download_path="$HOME/Downloads"

aws s3 cp "s3://$bucket/$file" "$download_path"

echo "Datei wurde heruntergeladen nach $download_path"
```

Aufruf:

```bash
./download.sh dhge-kasche-klausur-wi24 AWS_S3_Erfolg.pdf
```

---

## 💰 3. Ungefähre Kosten eines AWS-Services berechnen (Region: Frankfurt)

Beispielservice: **Amazon S3 Glacier Deep Archive**

---

### (1) 2 TB (2000 GB) Speicher dauerhaft gespeichert

Preis Frankfurt: **0.00186 USD pro GB/Monat**

Rechnung:

```
2000 GB * 0.00186 USD = 3.72 USD pro Monat
```

---

### (2) 100 GB Upload pro Monat

Kosten beim Upload bestehen aus:

- **PUT / Upload Requests**  
- **Lifecycle Requests** (falls vorhanden)

Beispiel aus der Aufgabenstellung:

```
100 GB Upload ergeben:
0.38 USD (PUT Requests)
+ 0.24 USD (sonstige Gebühren)
= 0.62 USD pro Monat
```

---

### 💵 Gesamtkosten pro Monat

```
Speicher:   3.72 USD
Uploads:    0.62 USD
-----------------------
Gesamt:     4.34 USD / Monat
```

---

## ☁️ 4. Die drei wesentlichen Cloud-Service-Modelle + Beispiel

### 🟣 **IaaS – Infrastructure as a Service**
Der Provider stellt **Grundinfrastruktur** bereit (VMs, Netzwerk, Storage).

**Beispiel:**  
- Amazon EC2  
- Azure Virtual Machines  
- Google Compute Engine  

---

### 🔵 **PaaS – Platform as a Service**
Der Provider bietet eine **komplette Plattform** zum Entwickeln & Deployen.

**Beispiel:**  
- AWS Elastic Beanstalk  
- Azure App Service  
- Google App Engine  

---

### 🟢 **SaaS – Software as a Service**
Der Provider stellt **fertige Anwendungen** bereit.

**Beispiel:**  
- Microsoft 365  
- Google Workspace  
- Salesforce  

---

