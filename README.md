
# ProjectR 📅 — Smart Scheduling & Appointment Management

**ProjectR** is an open-source mobile & web solution that helps **small and medium businesses** handle, track, and optimize appointments — with modern scheduling, real-time notifications, and a vision for AI-powered smart booking.

**Link to Design:**  https://www.figma.com/design/MVeaUyF5dKVPqE2ngOj4yu/Project-R?node-id=427-9226&t=VvlOFmwMdmMVJyaG-0

---

## 📌 Features

- 📆 Schedule and manage appointments
- 🔔 Real-time notifications
- 💬 In-app messaging (coming soon)
- 🔐 One Tap Customer Scheduling
- ☁️ Offline support with local storage

---

## 🧱 Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** Riverpod
- **Routing:** AutoRoute
- **Local Storage:** SharedPreferences
- **Networking:** Dio
- **CI/CD:** GitHub Actions (coming soon)
- **Backend API:** C# .NET 8 (https://github.com/classyk12/ProjectR.Backend)

---

## 🏗️ Project Structure

```

projectR-mobile/
├── lib/
│   ├── main.dart
│   ├── core/            # Shared utils, themes, constants
│   ├── features/        # Feature-based folders
│   └── routing/         # App navigation
├── assets/              # Static files (icons, images)
├── pubspec.yaml
├── analysis\_options.yaml
└── README.md

````

---

## ✅ Prerequisites

- Flutter SDK >= 3.x
- Dart >= 3.x
- Android Studio / Xcode / VS Code
- Backend API running locally or via Docker (see backend repo)

---

## 🛠️ Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/your-username/projectr-mobile.git
   cd projectr-mobile
````

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

4. **Run tests**

   ```bash
   flutter test
   ```

---

## 🔐 Environment Setup

Create a `.env` file or use your preferred method for managing environment variables:

```
API_BASE_URL=https://localhost:5001/api
AUTH_SECRET_KEY=your-secret
```

> For local backend testing, ensure the backend is running and CORS is configured. The api will be deployed to a dev environment soon and the app linked with it

---

## 🔄 API Integration

* Swagger UI for backend: (coming soon)
* All API services are abstracted into `lib/core/services/api_service.dart`.

---

## 📦 Build & Deployment

* Android: `flutter build apk --release`
* iOS: `flutter build ios --release`

CI/CD integration is optional and will be handled via GitHub Actions (coming soon).

---

## 🤝 Contributing

We welcome collaboration!

1. Fork the repository
2. Create a new feature branch (`feat/feature-name`)
3. Make your changes
4. Submit a pull request

> Please follow the existing folder structure and code style.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 👨‍💻 Maintainers

Faith Sodipe – Lead Developer
https://classykdigital.com

---

## 📬 Contact

Questions, issues, or ideas?
Open an issue and I will get to it as soon as

```

