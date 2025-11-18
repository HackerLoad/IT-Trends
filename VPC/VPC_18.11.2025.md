# AWS-Anleitung: VPC + Subnetz + EC2(Ubuntu) + HTTP-Server

## 1. VPC erstellen (10.17.0.0/16)
1. Gehe in der AWS-Konsole zu VPC → Ihre VPC's
2. Klick auf VPC erstellen
3. Wähle `nur VPC` aus
4. Einstellungen:
    - Name: `mein-vpc`
    - IPv4 CIDR: `10.17.0.0/16`
5. VPC erstellen

## 2. Subnetz erstellen (öffentliches Subnetz)
1. In der VPC-Ansicht: Subnets → Subnet erstellen
2. Einstellungen:
    - VPC: die VPC, die du gerade erstellt hast
    - Availability Zone: egal
    - IPv4 CIDR: z. B. 10.17.1.0/24
3. Subnet erstellen

## 3. Internet Gateway erstellen
1. Internet Gateways → Internet Gateway erstellen
    - Name: mein-igw
2. Gateway zu VPC hinzufügen → deine VPC auswählen

## 4. Routing für öffentliches Subnetz aktivieren
1. Route Tables → deine VPC finden
2. Routing-Tabelle auswählen → "Edit routes"
    - Neue Route:
    - Destination: 0.0.0.0/0
    - Target: Internet Gateway (IGW)
3. Unter "Subnet associations" → "Edit subnet associations"
4. Öffentliches Subnetz auswählen → speichern


## 5. EC2 Instanz (Ubuntu) starten
1. EC2 → Launch Instance
2. Einstellungen:
    - AMI: Ubuntu Server 22.04
    - Instance Type: t2.micro
3. Network:
    - VPC: deine VPC
    - Subnet: öffentliches Subnetz
    - Auto-assign Public IP: ENABLED
4. Security Group:
    - Regel 1: Type: HTTP (80) / Source: 0.0.0.0/0
    - Regel 2: Type: SSH (22) / Source: nur deine IP
5. Nach der Konfiguration → "Launch Instance"

## 6. Mit EC2 verbinden
1. Lade deine .pem-Datei herunter (falls noch nicht geschehen)
2. Terminal öffnen
3. Verbindung herstellen:
    - ssh -i deinKey.pem ubuntu@`<PUBLIC-IP-ADDRESS>`

## 7. Webserver installieren und "Hallo Dienstag" anzeigen
1. Paketliste aktualisieren:
    - sudo apt update

2. Apache Webserver installieren:
    - sudo apt install apache2 -y

3. Apache starten & aktivieren:
    - sudo systemctl enable apache2
    - sudo systemctl start apache2

4. "Hallo Dienstag" als Webseite setzen:
    - sudo nano /var/www/html/index.html
    - inhalt in `<h1>`oder `<p>` ändern



## 8. Test im Browser
1. Browser öffnen
2. URL eingeben:
   http://`PUBLIC-IP-ADDRESS`
3. Erwartete Ausgabe:
   "Hallo Dienstag"
