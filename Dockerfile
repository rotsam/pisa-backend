FROM python:3.10-slim

WORKDIR /app

# Install build deps (optional but safe)
RUN apt-get update && apt-get install -y gcc

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY . .

# EXPOSE a valid port so Railway sees it
EXPOSE 8000

# Run app (explicit shell to allow env var expansion)
CMD exec gunicorn app.main:app -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:${PORT:-8000}