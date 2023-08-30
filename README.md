# Custom Circular Progress Indicator

Welcome to the **Custom Circular Progress Indicator** project! This Flutter project offers a customizable circular progress indicator with animation and coloring effects.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The **Custom Circular Progress Indicator** is a Flutter package that provides a circular progress indicator with various customization options, including animation, color transitions, and more.

## Features

- Create circular progress indicators with customizations.
- Animation of the circular progress with adjustable speed and easing curve.
- Dynamic coloring of the progress units.
- Simple and straightforward usage.

## Getting Started

To integrate the **Custom Circular Progress Indicator** into your Flutter project, follow these steps:

1. Add the package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     custom_circular_progress: ^latest_version
     ```
2. Install the dependencies by running:
*flutter pub get*

## Usage
Import the package and use the CustomCircularProgress widget to create the custom circular progress indicator:

```dart
import 'package:custom_circular_progress/custom_circular_progress.dart';

// Inside your widget build method
CustomCircularProgress(
  details: IndicatorDetails(value: 0.2, itemCount: 10),
  color: Colors.blue,
  // Add more customizations here
)
```

## Contributing
Contributions are welcome! If you find any issues or want to enhance the package, feel free to [create a pull request](http://www.github.com/mryadavdilip/custom_circular_progress).

## License
This project is licensed under the MIT License.

# Author
Dilip Yadav,
Connect with me on [Linkedin](http://www.linkedin.com/in/mryadavdilip).