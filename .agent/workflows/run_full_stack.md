---
description: Run the full stack application (PocketBase + FastAPI + Flutter)
---
This workflow starts all three components required for the full application experience. You will need three separate terminal instances.

1. **Start PocketBase (Database)**
   Open a new terminal and run:
   ```powershell
   cd translation_api/pocketbase
   ./pocketbase.exe serve
   ```
   *Verify: Open http://127.0.0.1:8090/_/*

2. **Start FastAPI (Backend)**
   Open a second terminal and run:
   ```powershell
   cd translation_api
   # Ensure dependencies are installed if first time: pip install -r requirements.txt
   uvicorn main:app --reload
   ```
   *Verify: Open http://127.0.0.1:8000/docs*

3. **Start Flutter (Frontend)**
   Open a third terminal and run:
   ```powershell
   flutter run
   ```
