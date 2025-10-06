###CHECKOUT MY OUTPUT-VIDEO------------------> https://youtu.be/7emOGWErlos 


--------------------------------------------------------------------------------------------------------------------------

### Setup and Installation

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
    ```
2.  **Set up your Firebase Project:**
    -   Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    -   Add an Android app to your Firebase project.
    -   Download the `google-services.json` file and place it in the `android/app/` directory of the project.
    -   In the Firebase Console, go to **Authentication > Sign-in method** and enable the **Google** provider.
    -   Add your **SHA-1 fingerprint** to the Android app settings in Firebase to enable Google Sign-In.
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the application:**
    ```sh
    flutter run
    ```

-----------------------------------------------------------------------------------------------------------------------------------------

Here are the key packages used in this project and why they were chosen

| Package           | Reason                                                                                                 
| ----------------- | ------------------------------------------------------------------------------------------------------ 
| `firebase_core`   | Required to initialize the Firebase app and connect it to the Flutter project.                           
| `firebase_auth`   | The official Firebase plugin for handling all authentication logic, including user state management. 
| `google_sign_in`  | The official plugin to implement the native Google Sign-In flow on Android.                            
| `provider`        | A simple and efficient state management solution, used here to manage the app's theme (light/dark mode). 
| `lottie`          | [cite_start]Enables high-quality, smooth JSON-based animations, used for a professional-looking splash screen

--------------------------------------------------------------------------------------------------------------------------------------------






