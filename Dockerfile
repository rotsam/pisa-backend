
FROM python:3.10-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
CMD ["/bin/sh", "-c", "gunicorn app.main:app -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:${PORT}"]
