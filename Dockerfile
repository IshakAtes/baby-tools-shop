# 1. Starte mit einem Base-Image
FROM python:3.9-slim

# 2. Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# 3. Kopiere die requirements.txt in den Container
COPY requirements.txt /app/

# 4. Installiere alle Abhängigkeiten
RUN pip install -r requirements.txt

# 5. Kopiere die Projektdateien in den Container
COPY ./babyshop_app /app

# 6. Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8025

# 7. Starte die Anwendung
CMD ["python", "manage.py", "runserver"]
