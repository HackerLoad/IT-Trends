# 🟦 AWS VPC & EC2 Aufgaben — Komplettübersicht

---

## 🏗️ 1. Ein VPC mit vorgegebenem Namen und CIDR erstellen

AWS CLI:

```bash
aws ec2 create-vpc --cidr-block 10.27.0.0/16 --tag-specifications \
"ResourceType=vpc,Tags=[{Key=Name,Value=MeinVPC}]"
```

In der Konsole:
- VPC öffnen → “Create VPC”
- Name vergeben
- IPv4 CIDR eingeben: z. B. **10.27.0.0/16**

---

## 🧩 2. Bedeutung des CIDR-Wertes für ein VPC

Beispiel: **10.27.0.0/16**

- `/16` bedeutet: **16 Bits sind fix**, die restlichen 16 Bits sind frei
- dadurch entstehen:  
  **2^(32–16) = 65.536 IP-Adressen**
- gültiger Bereich:
  - **10.27.0.0 – 10.27.255.255**

Das VPC ist also ein großes Netzwerk, das wir weiter in Subnetze aufteilen können.

---

## 📐 3. CIDR-Werte für Subnetze bestimmen (je nach Anzahl der gewünschten Subnetze)

Wenn du z. B. **5 Subnetze** willst, brauchst du mindestens **/24**-Netze im /16-VPC:

| Subnetzgröße | Anzahl | IPs pro Subnetz |
|--------------|--------|----------------|
| `/24`        | 256    | ca. 251 nutzbar |
| `/25`        | 128    | ca. 123 nutzbar |
| `/26`        | 64     | ca. 59 nutzbar  |

Für 5 Subnetze ist **/24** üblich, da viel Platz und einfach.

Beispiele:

```
10.27.0.0/24
10.27.1.0/24
10.27.2.0/24
10.27.3.0/24
10.27.4.0/24
```

---

## 🔢 4. Wie viele IPs habe ich in einem Subnetz?

Beispiel: `/24`

```
2^(32–24) = 256 IPs
- 5 reservierte AWS IPs
= 251 nutzbare IPs pro Subnetz
```

Reserviert sind:
- .0 (Netzwerkadresse)
- .1 (VPC Router)
- .2 (DNS)
- .3 (AWS intern)
- .255 (Broadcast)

---

## 🌐 5. Subnetze mit eigener Routing-Tabelle erstellen, die Internet-Zugriff ermöglichen

### Voraussetzungen:
- Internet Gateway (IGW)
- Route Table mit:
  ```
  0.0.0.0/0 → igw-xxxx
  ```

### Vorgehen:
1. Subnet erstellen  
2. Route Table erstellen  
3. „Edit Routes“ → Default Route zu IGW setzen  
4. Route Table mit Subnet assoziieren  

Resultat: EC2 in diesem Subnet hat Internet.

---

## 🖥️ 6. EC2-Instanz mit HTTP-Dienst erstellen („Hello PUBLIC“ / „Hello PRIVATE“)

### Beispiel-User-Data:

#### PUBLIC-Instance:

```bash
#!/bin/bash
echo "Hello PUBLIC" > /var/www/html/index.html
yum install -y httpd
systemctl start httpd
systemctl enable httpd
```

#### PRIVATE-Instance:

```bash
#!/bin/bash
echo "Hello PRIVATE" > /var/www/html/index.html
yum install -y httpd
systemctl start httpd
systemctl enable httpd
```

---

## 🔐 7. Sicherheitsgruppe für PUBLIC-Instanz → Zugriff von außen erlauben

In der SG:

**Inbound Rule:**
```
Type: HTTP
Port: 80
Source: 0.0.0.0/0    (alle dürfen zugreifen)
```

Optional: SSH nur von deiner IP:
```
22 / TCP / 203.x.x.x/32
```

---

## 🔐 8. Sicherheitsgruppe für PRIVATE-Instanz → kein Zugriff von außen

**NICHT erlauben:**  
❌ HTTP von 0.0.0.0/0  
❌ SSH von 0.0.0.0/0

**ERLAUBT stattdessen:**  
✔ HTTP nur vom Public Subnet oder einer SG:

Beispiel:
```
HTTP / Port 80 / Source: sg-<ID-von-PUB-SG>
```

Damit:
- Außenwelt kommt **nicht** ran  
- Public EC2 (oder Bastion Host) **kann intern zugreifen**

---

## 📸 9. Aufgaben erledigen und im Backstage mit Screenshots dokumentieren

Erforderliche Screenshots:
- VPC Übersicht
- Subnet-Liste mit CIDRs
- Route Tables mit IGW-Routes
- Internet Gateway Attached
- EC2 PUBLIC – Aufruf von außen („Hello PUBLIC“)
- EC2 PRIVATE – Zugriff nur intern („Hello PRIVATE“)
- Security Groups  
- Optional: Ping/HTTP Tests zwischen den Instanzen  

---

## 🏢 10. Praxispartner-Anwendungsfall

### Szenario:
**Getrennte Public/Private Subnetze für ein internes Web- und Reporting-System**

#### Beispiel:
- **Public Subnet:** Proxy / Jump-Host / API-Entry
- **Private Subnet:**  
  - Hardware-Report-Backend  
  - Intune-API-Connector  
  - Datenbank für Geräteinformationen  

### Vorteile:
- Private Server haben **keinen direkten Internetzugang** → sicherer  
- Systeme für die Hardware-Auswertung sind isoliert  
- Skalierbare Web-API im Public Subnet  
- Ideal für deinen geplanten Hardware-Report (Intune + ACAT + TransICT)  

---

