# AWS Anleitung: VPC + 5 Subnets (1 Public & 4 Private)

## 1. VPC erstellen (10.12.0.0/16)
1. Gehe in der AWS-Konsole zu VPC --> Ihre VPCs
2. Klick auf VPC erstellen
3. Wähle `nur VPC` aus
4. Einstellungen:
    - Name: `vpc-mit-subnets`
    - IPv4 CIDR: `10.12.0.0/16`
5. VPC erstellen

## 2. Subnets erstellen
1. VPC --> Subnetze --> Subnetz erstellen
2. Einstellungen:
    - VPC: die VPC, die du gerade erstellt hast.

    ### 1. Subnetz (Öffentlich)
    - Name: sub1-pub
    - Availability Zone: egal
    - IPv4 CIDR: 10.12.0.0/24

    ### 2. / 3. / 4. & 5. Subnetz (Öffentlich)
    - Name: subx-prv
    - Availability Zone: egal
    - IPv4 CIDR: 10.12.0.n/24 (n = 2 / 3 / 4 / 5)

## 3. Internet Gateway erstellen
1. Internet Gateways --> Internet Gateway erstellen
    - Name: Gateway-10-12
2. Gateway zu VPC hinzufügen --> deine VPC auswählen

## 4. Routing-Tabellen erstellen
1. Routing-Tabellen --> Routing-Tabelle erstellen
2. Einstellungen (Öffentlich):
    - Name: `rt-10-12-pub`
    - VPC: `vpc-mit-subnets`
    - Zurück zur Übnersicht
    - Routing-Tabelle auswählen `rt-10-12-pub`
    - Routen auswählen --> Routen bearbeiten
    - Neue Route erstellen
    - Bestimmungsort: 10.12.0.0/16
    - Ziel: `local`
    - Bestimmungsort: 0.0.0.0/0
    - Ziel: `Gateway-10-12`
    - Subnetzzuordnungen auswählen
    - Subnetzzuordnungen bearbeiten --> sub1-pub auswählen & speichern
3. Einstellungen (Privat):
    - Name: `rt-10-12-prv`
    - VPC: `vpc-mit-subnets`
    - Zurück zur Übnersicht
    - Routing-Tabelle auswählen `rt-10-12-prv`
    - Routen auswählen --> Routen bearbeiten
    - Neue Route erstellen
    - Bestimmungsort: 10.12.0.0/16
    - Ziel: local
    - Subnetzzuordnungen auswählen
    - Subnetzzuordnungen bearbeiten --> subn-prv auswählen & speichern (n = 2 / 3 / 4 /5)

## 5. EC2 Instanz starten (Öffentlich)
1. EC2 → Launch Instance
2. Einstellungen:
    - AMI: Amazon Linux
    - Instance Type: t2.micro
3. Network:
    - VPC: deine VPC
    - Subnet: dein sub1-pub
    - Auto-assign Public IP: ENABLED
4. Security Group:
    - Regel 1: Type: HTTP (80) / Source: 0.0.0.0/0
    - Regel 2: Type: SSH (22) / Source: nur deine IP
5. Nach der Konfiguration → "Launch Instance"

## 6. EC2 Instanz starten (Privat)
1. EC2 → Launch Instance
2. Einstellungen:
    - AMI: Amazon Linux
    - Instance Type: t2.micro
3. Network:
    - VPC: deine VPC
    - Subnet: dein sub2-prv
    - Auto-assign Public IP: DISABLED
4. Security Group:
    - Regel 2: Type: SSH (22) / Source: 10.12.0.0/16
5. Nach der Konfiguration → "Launch Instance"
