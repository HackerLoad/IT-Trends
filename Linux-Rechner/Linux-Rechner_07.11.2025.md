## Linux-Rechner starten & einloggen (cal ausführen)

1. EC2 → Neue Instanz starten (Ubuntu oder Amazon Linux)
2. Sicherheitsgruppe:
   - SSH (22) → eigene IP erlauben
3. Auf Instanz verbinden:
   ssh -i key.pem ec2-user@<PUBLIC-IP>
   oder:
   ssh -i key.pem ubuntu@<PUBLIC-IP>
4. Befehl ausführen:
   cal