# backend/Dockerfile
FROM python:3.11-slim

# System deps for WeasyPrint and general tools
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    build-essential \
#    wget \
#    libffi-dev \
#    libpq-dev \
#    libxml2 \
#    libxml2-dev \
#    libjpeg-dev \
#    zlib1g-dev \
#    libpangocairo-1.0-0 \
#    libcairo2 \
#    libgdk-pixbuf2.0-0 \
#    fonts-liberation \
#    ca-certificates \
#    git \
#    && rm -rf /var/lib/apt/lists/*

# Create app user
##ENV APP_USER=app
##RUN useradd -ms /bin/bash ${APP_USER}
##WORKDIR /app

# Copy dependency files first for caching
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r /app/requirements.txt

# Copy the Django project
##COPY backend/ /app/

# Copy entrypoint
##COPY backend/entrypoint.sh /app/entrypoint.sh
##RUN chmod +x /app/entrypoint.sh

ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=jura_backend.settings
ENV PORT=8000

# Expose port for HTTP/ASGI
EXPOSE 8000

##USER ${APP_USER}

# Run migrations and start Daphne via entrypoint.sh
##ENTRYPOINT ["/app/entrypoint.sh"]
