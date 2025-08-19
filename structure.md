flutter_base_project/
|
|-- assets/
|   |-- images/         # For .png, .jpg files
|   |-- gifs/           # For animated .gif files
|   |-- loaders/        # For loading animations (e.g., Lottie files)
|
|-- lib/
|   |
|   |-- api/
|   |   |-- api_constants.dart   # To store base URLs and endpoints
|   |   |-- api_service.dart     # The generic class for making API calls
|   |   |-- api_response.dart    # A wrapper class for API responses
|   |   |-- api_repository       # contains all functions
|   |
|   |-- common/
|   |   |-- app_constants.dart   # For other app-wide constants
|   |   |-- common_functions.dart# For utility functions
|   |
|   |-- components/
|   |   |-- custom_scaffold.dart # Example of a reusable widget
|   |   |-- custom_button.dart   # Example of a reusable widget
|   |
|   |-- enums/
|   |   |-- api_enums.dart       # Enums for HTTP methods (GET, POST, etc.)
|   |
|   |-- literals/ (This will be handled by Flutter's l10n system)
|   |   |-- l10n/
|   |   |   |-- app_en.arb       # English language literals
|   |   |   |-- app_es.arb       # Spanish language literals (as an example)
|   |
|   |-- models/
|   |   |-- user_model.dart      # Example data model
|   |
|   |-- router/
|   |   |-- app_router.dart      # Configuration for go_router
|   |
|   |-- screens/
|   |   |-- home/
|   |   |   |-- home_screen.dart
|   |   |-- settings/
|   |   |   |-- settings_screen.dart
|   |
|   |-- themes/
|   |   |-- app_themes.dart      # Definitions for light and dark themes
|   |   |-- theme_provider.dart  # State management for the theme
|   |
|   |-- validations/
|   |   |-- form_validators.dart # Functions for email, password validation etc.
|   | 
|   |-- main.dart                # The application's entry point
|
|-- pubspec.yaml                 # Project dependencies and asset declarations
|-- l10n.yaml                    # Configuration file for localization
|-- README.md                    # Project documentation




/lib/core → constants, utils, configs,api's

/lib/data → models, services, repositories, enums ,validations

/lib/ui → screens, widgets, components,router

/lib/l10n → localization files

/lib/theme → colors, typography, styles

/lib/mock →jsons for api's