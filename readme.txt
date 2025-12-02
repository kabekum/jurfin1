Jura Full Stack — Multiplatform (Django + Channels + WeasyPrint + Flutter)

Quick start (backend dev):
1. cd backend
2. python -m venv .venv && source .venv/bin/activate
3. pip install -r requirements.txt
4. python manage.py makemigrations
5. python manage.py migrate
6. python manage.py createsuperuser
7. Run Redis (channels): redis-server
8. Run ASGI server: daphne jura_backend.asgi:application  (or runserver for HTTP only)
9. Visit http://127.0.0.1:8000/admin

WeasyPrint: ensure system dependencies (cairo, pango, gdk-pixbuf) are installed.

Quick start (Flutter dev):
1. cd frontend/flutter_app
2. flutter pub get
3. flutter run -d chrome  # web
4. flutter run -d emulator  # mobile

Notes:
- Change API base URLs in Flutter `AuthProvider` and `ApiService`.
- Add `AUTH_USER_MODEL = 'core.User'` to settings before migrations.
