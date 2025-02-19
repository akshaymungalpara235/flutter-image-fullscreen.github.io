# Flutter Image Fullscreen Task

## Overview
This project is a Flutter web application that allows users to load and display images from URLs. The app includes functionality to toggle full-screen mode, manage image display dynamically, and utilize a context menu for additional actions.

## Features
- **Load and Display Images**: Users can enter an image URL to display the image within the application.
- **Full-Screen Mode**: Double-tap on an image to toggle full-screen mode.
- **Context Menu**: Provides options to enter and exit full-screen mode.
- **State Management**: Utilizes GetX for managing the application's state.
- **HTML Image Rendering**: Uses `HtmlElementView` to render images efficiently.

## Technologies Used
- **Flutter**: Framework for building the web application.
- **GetX**: State management solution.
- **HTML & JavaScript Interop**: Enables interaction with the browser environment.

## Installation
### Prerequisites
- Install Flutter (Ensure you have Flutter SDK installed: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install))
- Enable Flutter web (`flutter config --enable-web`)

### Steps
1. Clone the repository:
   ```sh
   https://github.com/akshaymungalpara235/flutter_image_fullscreen_task.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter-web-task
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run -d chrome
   ```

## Project Structure
```
flutter-web-task/
├── lib/
│   ├── main.dart  # Entry point of the application
│   ├── presentation/
│   │   ├── home/
│   │   │   ├── home_page.dart  # UI implementation of the home page
│   │   │   ├── home_controller.dart  # Controller using GetX for state management
│   ├── utils/
│   │   ├── constants/
│   │   │   ├── app_strings.dart  # Stores app-wide string constants
├── web/  # Web-specific configurations
├── README.md  # Project documentation
```

## Usage
1. Enter an image URL in the text field.
2. Click the arrow button to load and display the image.
3. Double-tap the image to toggle full-screen mode.
4. Use the floating action button to open the context menu.
5. Select "Enter Full Screen" or "Exit Full Screen" from the menu.

## Contributions
Contributions are welcome! Feel free to fork the repository and submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For any issues or inquiries, reach out via email: `akshaymungalpara235@gmail.com`

