# Baho App

Welcome to the Baho App, an innovative mobile application designed to simplify booking appointments with healthcare professionals in Rwanda.

## Link to Demo

[Link to Baho App video] (https://drive.google.com/file/d/19BRrx1YG57EmB0KYnsyHyTiuxF7RC6RI/view?usp=sharing&authuser=1)


## Introduction

Baho App aims to revolutionize healthcare accessibility by making it as easy to book a doctor's appointment as ordering food or a ride. The app provides detailed profiles of healthcare professionals, including qualifications, specialties, and patient ratings, enabling users to make informed decisions about their care.

## Team

- Kevin Nyiringango
- Charite Uwatwembi
- Johnson Tuyishime

## Project Summary

Baho addresses the significant problem of inefficiencies in traditional booking methods in Rwanda, which involve lengthy queues and limited availability, often leading to delayed or missed medical care. This app is a non-profit initiative driven by improving healthcare accessibility and outcomes in Rwanda.

## Key Features and Functionalities

1. **Homepage**: An intuitive homepage that serves as the gateway to the application.
2. **Dashboard**: A curated list of doctors categorized based on their domains and specialties.
3. **Doctor Details**: Detailed profiles for each healthcare professional, including qualifications, areas of expertise, patient ratings, and availability.
4. **Appointment Booking**: Allows users to schedule appointments directly from the app.
5. **Communication Options**: Multiple communication channels for interacting with doctors, including chat and call options.


### Baho's Unique Features
- User-friendly design
- Comprehensive doctor profiles
- Enhanced communication options
- Leveraging Rwanda's widespread mobile phone penetration

## Installation

### Prerequisites

Ensure you have Flutter installed on your machine. You can download and install Flutter from [Flutter's official website](https://flutter.dev/docs/get-started/install).

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/baho_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd baho_app
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Usage

### Running the App

To run the app on an emulator or a physical device, use the following command:
```bash
flutter run
```

### Navigation

The app uses GetX for state management and navigation. Ensure to use `Get.to()` for navigation between screens.

## Directory Structure

```
baho_app/
├── lib/
│   ├── consts/
│   │   ├── consts.dart
│   │   ├── images.dart
│   │   ├── strings.dart
│   │   └── fonts.dart
│   ├── res/
│   │   ├── components/
│   │   │   ├── custom_button.dart
│   │   │   └── custom_textfield.dart
│   ├── views/
│   │   ├── Login_view/
│   │   │   └── login_view.dart
│   │   ├── SignUp_View/
│   │   │   └── signup_view.dart
│   │   ├── Home_view/
│   │   │   └── home_view.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
```


## Dependencies

- [Flutter](https://flutter.dev/)
- [GetX](https://pub.dev/packages/get)
- [VelocityX](https://pub.dev/packages/velocity_x)
- [AutoSizeText](https://pub.dev/packages/auto_size_text)


## Contributing

We welcome contributions! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to contact us at [baho@gmail.com].

