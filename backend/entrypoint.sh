#!/usr/bin/env bash
set -e

# Simple entrypoint - run migrations, collectstatic, then daphne
# Accepts env vars: DJANGO_SUPERUSER_USERNAME, DJANGO_SUPERUSER_EMAIL, DJANGO_SUPERUSER_PASSWORD

echo "Waiting for DB (if required)..."
# Optionally add wait-for logic (e.g. wait-for-it) if you want to wait for Postgres

echo "Apply database migrations..."
python manage.py migrate --noinput

echo "Collect static files..."
python manage.py collectstatic --noinput

# Create superuser if env provided and not exists
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_EMAIL" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ]; then
  echo "Creating superuser (if not exists)..."
  python - <<PY
from django.contrib.auth import get_user_model
User = get_user_model()
u = "$DJANGO_SUPERUSER_USERNAME"
e = "$DJANGO_SUPERUSER_EMAIL"
p = "$DJANGO_SUPERUSER_PASSWORD"
if not User.objects.filter(username=u).exists():
    User.objects.create_superuser(u, e, p)
    print("Superuser created.")
else:
    print("Superuser already exists.")
PY
fi

echo "Starting Daphne..."
# Run Daphne (ASGI) to serve Channels + HTTP
# Use environment variable WORKERS or other orchestration if needed
daphne -b 0.0.0.0 -p ${PORT:-8000} jura_backend.asgi:application
