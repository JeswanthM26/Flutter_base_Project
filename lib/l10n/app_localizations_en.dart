// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appBarTitle => 'ApzInputField Preview';

  @override
  String get label => 'Label';

  @override
  String get placeholder => 'Placeholder';

  @override
  String get textDescription => 'This is a text description to provide more information.';

  @override
  String get enter4DigitOTP => 'Enter 4-Digit OTP';

  @override
  String get enter6DigitOTP => 'Enter 6-Digit OTP';

  @override
  String get amount => 'Amount';

  @override
  String get productsApi => 'Products (API)';

  @override
  String get productsMock => 'Products (Mock)';

  @override
  String get deleteProductTitle => 'Delete Product?';

  @override
  String deleteProductContent(String productTitle) {
    return 'Are you sure you want to delete \'$productTitle\'?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get createProduct => 'Create Product';

  @override
  String get title => 'Title';

  @override
  String get titleIsRequired => 'Title is required';

  @override
  String get price => 'Price';

  @override
  String get priceIsRequired => 'Price is required';

  @override
  String get enterAValidPrice => 'Enter a valid price';

  @override
  String get description => 'Description';

  @override
  String get descriptionIsRequired => 'Description is required';

  @override
  String get save => 'Save';

  @override
  String get noProductsFound => 'No products found. Add one!';

  @override
  String anErrorOccurred(String error) {
    return 'An error occurred: $error';
  }
}
