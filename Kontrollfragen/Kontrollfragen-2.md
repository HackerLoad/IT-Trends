# Kontrollfragen 2

## REST-Schnittstelle per CMD ausführen
1. **GET-Abfrage:**
   - `curl GET https://api.beispiel.de/users`
   - Ruft Daten einer Ressource ab (lesender Zugriff)

2. **POST-Abfrage:**
   - `curl POST https://api.beispiel.de/users`
   - Sendet Daten an den Server (z. B. zum Erstellen neuer Einträge)

## Aufbau einer REST-Schnittstelle
Eine REST-Schnittstelle besteht aus:

1. **Ressourcen**
   - Alles wird als Ressource betrachtet (z. B. /users, /orders)

2. **HTTP-Abfragen (Methoden)**
   - GET, POST, PUT, DELETE usw.

3. **URLs (Endpunkte)**
   - Beschreiben eindeutig, wo eine Ressource erreichbar ist

4. **Request**
   - Anfrage des Clients (Methode, Header, Body)

5. **Antwortformat (Response)**
   - Serverantwort, meist in JSON oder XML

## Eigenschaften & Vorteile von REST-Schnittstellen

### Eigenschaften
- **Stateless:**  
  Der Server speichert keine Session-Daten → jede Anfrage ist unabhängig.
- **Ressourcenorientiert:**  
  Alles wird als Ressource modelliert.
- **Standardisierte HTTP-Methoden:**  
  GET, POST, PUT, DELETE usw.
- **Einheitliches Datenformat:**  
  Meist JSON.
- **Klare Statuscodes:**  
  Z. B. 200 OK, 404 Not Found, 500 Server Error.

### Vorteile
- Leicht verständlich & einfach umzusetzen
- Hohe Skalierbarkeit (Stateless-Prinzip)
- Plattformunabhängig
- Flexibel einsetzbar
- Sehr weit verbreitet → viele Tools & Frameworks verfügbar

## Unterschied zwischen Microservices und serviceorientierter Architektur (SOA)

### Serviceorientierte Architektur (SOA)
- Größer, zentraler aufgebaut
- Oft mit zentralem Enterprise Service Bus (ESB)
- Services eher stark gekoppelt

### Microservices
- Klein, flexibel, unabhängig
- Jeder Service ist autonom
- Einzelnes Deployment & Skalierung möglich

**Kurz:**  
SOA = groß & zentralisiert  
Microservices = klein, flexibel & unabhängig
