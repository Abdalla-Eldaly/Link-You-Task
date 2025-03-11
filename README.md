# LinkYou Task Management App

## Overview
This project is a task management application developed as part of a job task for **LinkYou** company. The application follows **Clean Architecture** with the **MVVM** design pattern and integrates multiple design patterns to ensure **scalability, maintainability, and modularity**.

## Project Structure
The project is structured into four main layers:
- **Core Layer** (Foundation of the App)
- **Data Layer** (Handles Data Retrieval and Storage)
- **Domain Layer** (Business Logic)
- **Presentation Layer** (UI and State Management)

Each layer is responsible for a specific part of the application and communicates with other layers through well-defined interfaces.

---

## 📌 Core Layer (Foundation of the App)
**Located in** `lib/core/`, this layer contains essential functionalities required across the application.

**Structure:**
- `common/` → Widgets and Validators
- `di/` → Dependency Injection (Dagger-like setup using GetIt)
- `mapper/` → Data Mappers for DTO to Model conversions
- `provider/` → Stores user data using local storage solutions (Hive, Shared Preferences)
- `routes/` → Manages application navigation

**Key Features:**
✔ **Dependency Injection (DI)** for managing dependencies efficiently.  
✔ **Validation Utilities** for form handling and error checking.  
✔ **Global Route Management** for seamless navigation.  
✔ **Data Mapping Layer** to transform data between different layers.  

---

## 🗂 Data Layer (Handles Data Retrieval and Storage)
**Located in** `lib/data/`, this layer is responsible for fetching, caching, and persisting data.

**Structure:**
- `contracts/` → Defines Online and Offline Data Sources
- `data_source_impl/` → Implements both Online and Offline Data Sources
- `dtos/` → Data Transfer Objects (e.g., HiveUserDTO and UserDTO)
- `network/` → Network Service Handling
- `models/` → Includes Request and Response Cache Models
- `repositoryimpl/` → Implements Repository Pattern for data abstraction

**Key Features:**
✔ **Implements Repository Pattern** for abstraction.  
✔ **Supports Offline First Strategy** using Hive & Shared Preferences.  
✔ **Uses Retrofit/Dio** for network communication.  
✔ **Caches API responses** to enhance performance.  

---

## 🏗 Domain Layer (Business Logic)
**Located in** `lib/domain/`, this layer contains the application's core business logic and enforces clean separation.

**Structure:**
- `repository/` → Defines the interfaces that the Data Layer implements
- `models/` → Pure domain models, independent of external libraries
- `usecases/` → Business logic that performs actions in the app

**Key Features:**
✔ **Use Cases** ensure that business logic is well-organized.  
✔ **Pure Dart Models** to maintain independence from frameworks.  
✔ **Repository Abstraction** to provide a clean API for the Presentation Layer.  

---

## 🎨 Presentation Layer (UI and State Management)
**Located in** `lib/presentation/`, this layer is responsible for user interface and state management.

**Structure:**
- `base/` → Includes BaseCubit, BaseWidget, BlocObserver, BaseBuilder, BaseListener
- `screens/` → Contains all UI screens

**Key Features:**
✔ **State Management** using Bloc/Cubit.  
✔ **Base Classes for Reusability** to reduce boilerplate.  
✔ **Well-structured UI Components** following MVVM.  

---

## 🌍 Additional Features & Enhancements
✔ **Easy Localization:** Implements multilingual support with easy_localization.  
✔ **Offline Support:** Stores API responses locally using Hive & Shared Preferences.  
✔ **User Authentication:** Login credentials persist securely using local storage.  
✔ **Scalable Architecture:** Ensures future-proof development using clean separation of concerns.  
✔ **Error Handling & Logging:** Integrated structured error handling and logging mechanisms.  
✔ **Code Reusability:** Uses design patterns to maintain modularity and clean code practices.  

---

## 📌 Getting Started
### 1️⃣ Install Dependencies
```sh
flutter pub get
