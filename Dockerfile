# 1. Starte mit einem Base-Image
FROM python:3.9-slim

# 2. Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# 3. Kopiere requirements.txt in das Docker-Image
COPY requirements.txt /app/

# 4. Kopiere die Projektdateien in den Container
COPY ./babyshop_app /app

# 5. Installiere alle Abhängigkeiten
RUN pip install -r requirements.txt

# 6. Sammle die statischen Dateien
# RUN python manage.py collectstatic --noinput

# 7. Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8025

# 8. Starte die Anwendung
CMD ["python", "manage.py", "runserver", "0.0.0.0:8025"]
