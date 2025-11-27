# 🌩️ Cloud Computing — Zusammenfassung

---

## 🟦 Was ist Cloud Computing? (Definition)

Cloud Computing bezeichnet die Bereitstellung von IT-Ressourcen  
(z. B. Server, Speicher, Datenbanken, Netzwerke, Software)  
**über das Internet auf Abruf**, statt lokale Hardware zu betreiben.

Typische Eigenschaften:
- On-Demand nutzbar
- Skalierbar nach Bedarf
- Abrechnung nach Nutzung („Pay as you go“)
- Zugriff von überall
- Kein eigenes Rechenzentrum notwendig

---

## 🟠 Bildliche Darstellung (ASCII)

```
                        ☁️ Die Cloud
                +--------------------------+
                |  • Rechenleistung (VMs) |
                |  • Speicher (S3, Blobs) |
                |  • Datenbanken          |
                |  • KI/Analyse           |
                |  • Security/Monitoring  |
                +--------------------------+
                            ▲
                            │ Internet
                            ▼
+----------------+    +----------------+    +----------------+
|   Laptop       |    |   Smartphone   |    |  Firmenserver  |
+----------------+    +----------------+    +----------------+
       ▲                      ▲                      ▲
       └────────────── Zugriff aus überall ──────────┘
```

---

## 🔴 Argumente *gegen* Cloud-Verwendung

- Datenschutz/Compliance-Risiken (DSGVO)
- Abhängigkeit vom Internet
- Vendor Lock-In (schwerer Anbieterwechsel)
- Hohe Kosten bei falscher Konfiguration
- Weniger Hardware-Kontrolle
- Sicherheitsrisiken bei Fehlkonfiguration
- Cloud-Know-how erforderlich

---

## 🟢 Argumente *für* Cloud-Verwendung

- Hohe Skalierbarkeit
- Pay-as-you-go Kostenmodell
- Hohe Sicherheit durch Provider (Patching, SLAs)
- Weniger eigener Administrationsaufwand
- Weltweiter Zugriff
- Schnelle Bereitstellung neuer Services
- Automatische Backups / Redundanz
- Viele integrierte Services (KI, Datenbanken, Monitoring)

---

## 🏢 Beispielprozess beim Praxispartner, der verbessert werden könnte

### Automatisierter Hardware-Report in der Cloud

**Problem aktuell:**
- Daten kommen aus vielen Quellen (Intune, ACAT, WorkspaceONE, TransICT)
- Teilweise on-Prem Infrastruktur
- Power BI Gateway notwendig
- Wartungsaufwand hoch

**Cloud-Lösung:**
- Zentrale Speicherung in AWS DynamoDB / Azure CosmosDB
- Automatisierte Verarbeitung durch AWS Lambda / Azure Functions
- Dashboards direkt über Cloud-Datenquelle (kein Gateway)
- Hohe Skalierbarkeit für große Geräteflotten

**Vorteile:**
- Weniger Wartung  
- Schnellere Datenverarbeitung  
- Höhere Verfügbarkeit  

---

## ☁️ Beispiel-Services einer Cloud

### Compute
- AWS EC2 / Azure VM / Google Compute Engine
- AWS Lambda / Azure Functions (Serverless)

### Storage
- AWS S3
- Azure Blob Storage
- Google Cloud Storage

### Datenbanken
- AWS RDS (MySQL, PostgreSQL)
- Azure SQL
- DynamoDB / Firestore (NoSQL)

### Netzwerk
- VPC / Subnets
- Load Balancer
- VPN Gateway

### Security
- AWS IAM
- Azure Active Directory
- Key Management Services (AWS KMS / Azure Key Vault)

### AI & Analytics
- AWS Bedrock
- Azure OpenAI
- BigQuery / AWS Athena

---
