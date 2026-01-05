# 🚀 How to Run LangXC

This guide will walk you through setting up and running the **LangXC** application locally. The app consists of three components:

1. **PocketBase** – Database & Authentication
2. **FastAPI** – Backend API / Middleware
3. **Flutter** – Mobile/Web Frontend

---

## 📋 Prerequisites

Before you begin, make sure you have the following installed:

| Tool | Version | Download |
|------|---------|----------|
| **Flutter SDK** | 3.10.0+ | [flutter.dev](https://flutter.dev/docs/get-started/install) |
| **Python** | 3.10+ | [python.org](https://www.python.org/downloads/) |
| **Git** | Latest | [git-scm.com](https://git-scm.com/downloads) |
| **Docker** (Optional) | Latest | [docker.com](https://www.docker.com/products/docker-desktop) |

---

## 🛠️ Quick Start (Manual Setup)

You need to run **3 terminals** simultaneously:

### **Terminal 1: PocketBase (Database)**

```bash
cd translation_api/pocketbase
./pocketbase.exe serve
```

> 📌 **Admin UI:** [http://127.0.0.1:8090/_/](http://127.0.0.1:8090/_/)

### **Terminal 2: FastAPI (Backend API)**

```bash
# Navigate to backend directory
cd translation_api

# Create virtual environment (first time only)
python -m venv .venv

# Activate virtual environment
# Windows:
.\.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

# Install dependencies (first time only)
pip install -r requirements.txt

# Copy environment file (first time only)
cp .env.example .env
# Edit .env with your credentials if needed

# Run the FastAPI server
uvicorn main:app --reload
```

> 📌 **API Docs (Swagger):** [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

### **Terminal 3: Flutter (Frontend)**

```bash
# Get dependencies (first time only)
flutter pub get

# Run on Chrome (Web)
flutter run -d chrome

# Run on Android Emulator
flutter run -d android

# Run on Windows Desktop
flutter run -d windows
```

---

## 🐳 Docker Setup (Alternative)

If you prefer using Docker, you can run PocketBase and FastAPI together:

```bash
cd translation_api

# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

Then run Flutter separately:

```bash
flutter run -d chrome
```

---

## ⚙️ Environment Configuration

### Backend `.env` File

Create a `.env` file in the `translation_api/` directory with the following:

```env
# PocketBase Admin Credentials
POCKETBASE_EMAIL=your-email@example.com
POCKETBASE_PASSWORD=your-secure-password

# Papago API Keys (For Translation)
PAPAGO_CLIENT_ID=your-papago-client-id
PAPAGO_CLIENT_SECRET=your-papago-client-secret

# App Settings
DEBUG=True
```

### Android Emulator Note

If running on an **Android Emulator**, change `localhost` to `10.0.2.2` in:

```
lib/core/services/backend_api_service.dart
```

---

## 🔗 Service URLs

| Service | URL | Description |
|---------|-----|-------------|
| **Flutter Web** | [http://localhost:8080](http://localhost:8080) | Frontend application |
| **FastAPI** | [http://127.0.0.1:8000](http://127.0.0.1:8000) | Backend API |
| **Swagger Docs** | [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs) | API documentation |
| **PocketBase Admin** | [http://127.0.0.1:8090/_/](http://127.0.0.1:8090/_/) | Database admin panel |

---

## 🧪 Testing the Backend

Run the API tests:

```bash
cd translation_api
pytest test_api.py -v
```

---

## 🐛 Troubleshooting

### Common Issues

| Problem | Solution |
|---------|----------|
| `uvicorn: command not found` | Activate the virtual environment first |
| `CORS errors in browser` | Ensure FastAPI is running on port 8000 |
| `Connection refused on Android` | Use `10.0.2.2` instead of `localhost` |
| `PocketBase not connecting` | Make sure PocketBase is running on port 8090 |
| `Flutter web not loading` | Check if all 3 services are running |

### Reset Everything

```bash
# Reset Flutter
flutter clean
flutter pub get

# Reset Python environment
cd translation_api
rm -rf .venv
python -m venv .venv
source .venv/bin/activate  # or .\.venv\Scripts\activate on Windows
pip install -r requirements.txt
```

---

## 📱 Running on Different Platforms

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Build for production
flutter build web
flutter build apk
flutter build windows
```

---

## 📚 Additional Resources

- [BACKEND_INTEGRATION.md](./BACKEND_INTEGRATION.md) - Backend architecture details
- [FIREBASE_WEB_SETUP.md](./FIREBASE_WEB_SETUP.md) - Firebase configuration
- [PAPAGO_WEB_SETUP.md](./PAPAGO_WEB_SETUP.md) - Papago translation API setup

---

## ✅ Checklist

Before running, ensure:

- [ ] PocketBase is running (port 8090)
- [ ] FastAPI is running (port 8000)
- [ ] `.env` file is configured
- [ ] Flutter dependencies are installed (`flutter pub get`)
- [ ] All 3 terminals are running simultaneously

---

*Happy coding! 🎉*
