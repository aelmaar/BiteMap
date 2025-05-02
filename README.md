<p>
  <img src="https://github.com/user-attachments/assets/3704b203-d794-4100-b4f7-6ef88206c0d8" alt="BiteMap Logo" width="150" />
</p>

**BiteMap** is a SwiftUI-powered iOS application that helps users discover nearby restaurants using real-time location. It combines elegant UI, powerful location services, and Google Places API to deliver a smooth, dark-mode-ready restaurant discovery experience.

---

## 🚀 Features

- 📍 Detects and tracks user's current location
- 🍽️ Displays nearby restaurants in real-time
- 🔍 Search filter to find specific restaurant names
- 📷 Displays restaurant images using Google Places Photo API
- 🗺 Full-screen detail view with map and restaurant metadata
- 🌗 Full support for dark and light mode
- ✨ Smooth loading animation (shimmer) while data loads
- 🔒 Graceful handling of denied location permissions

## 🛠 Getting Started

### Requirements

- iOS 17+
- Xcode 15+
- A Google Maps API key

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/bitemap.git
```
### 2. Open the project
```
cd bitemap
open bitemap.xcodeproj
```

### 3. Create a Config.xcconfig File

To provide your Google API key securely:

1. At the root of the project, create a new file named Config.xcconfig.
2. Add the following line to the file:

```bash
GOOGLE_API_KEY=your-google-api-key-here
```

### 4. Run the App
```
⌘ + R
```

> [!Note]
> The iOS simulator doesn't automatically use your current location. You need to manually set a predefined or custom location in the simulator:
> - In the simulator, go to the top menu and select `Features > Location`.
> - Choose from several predefined locations such as "Apple" (Apple's headquarters), "City Run," "Freeway Drive," etc.
> - To set a specific location, select `Custom Location...` and enter the latitude and longitude of the desired location.
> - On a real iPhone device, the app will use your actual current location.

## 🔒 Security
- 🔑 Never commit your API key to version control
- 🛡️ Keep your API key secure and private
- ⚙️ Set up proper API key restrictions in Google Cloud Console:
  - Restrict to iOS apps only
  - Limit to your bundle identifier
  - Enable only required APIs (Places API and Maps SDK)
 
## 📌 Upcoming Features

- Firebase Authentication with Google and Email/Password

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
