### 📱 Random Quotes App (iOS)

A simple and clean iOS application that fetches and displays random quotes from a remote API. Built using Swift, URLSession, and structured with Clean Architecture + MVVM along with an Observable pattern for reactive data binding.

### ✨ Features
	•	Fetch random quotes from API
	•	Networking using URLSession
	•	Clean Architecture separation (Presentation / Domain / Data)
	•	MVVM pattern for scalable UI logic
	•	Observable pattern for reactive updates
	•	Error handling & loading states
	•	Lightweight and responsive UI


### 🏗️ Architecture

This project follows Clean Architecture + MVVM, ensuring scalability and maintainability.

### Layers:
- Presentation Layer
	•	ViewControllers
	•	ViewModels
	•	Observables (binding UI to data)

- Domain Layer
	•	Use Cases
	•	Entities (Quote model)

- Data Layer
	•	API Services (using URLSession)
	•	Repository Implementation


### 🔄 Observable Pattern

A simple custom observable is used to bind data between ViewModel and ViewController.

## Example:

class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T?) -> Void)?
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T?) -> Void) {
        self.listener = listener
        listener(value)
    }
}

### 🧩 MVVM Flow
	•	ViewController requests data from ViewModel.
	•	ViewModel calls UseCase.
	•	UseCase fetches data from Repository.
	•	Repository calls API Service.
	•	Response flows back to ViewModel, which updates Observable.
	•	UI updates based on changes in Observable.


### 📸 Screenshots
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2026-04-02 at 15 51 33" src="https://github.com/user-attachments/assets/96b7c369-88eb-46d6-aa2a-91628d7566c1" />
