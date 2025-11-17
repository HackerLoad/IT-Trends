## Linux-Instanz mit HTTP-Daemon (Standardseite anzeigen)

1. Linux-Instanz starten (Ubuntu oder Amazon Linux)
2. Sicherheitsgruppe:
   - HTTP (80) → 0.0.0.0/0
3. Einloggen:
    - ssh -i key.pem ubuntu@`<PUBLIC-IP>`
4. Webserver installieren:
    - sudo apt update
    - sudo apt install apache2 -y
    - sudo systemctl enable apache2
    - sudo systemctl start apache2
5. Test:
    - http://`<PUBLIC-IP>`