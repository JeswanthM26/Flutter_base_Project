// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appBarTitle => 'ApzInputField ప్రివ్యూ';

  @override
  String get label => 'లేబుల్';

  @override
  String get placeholder => 'ప్లేస్‌హోల్డర్';

  @override
  String get textDescription => 'మరింత సమాచారం అందించడానికి ఇది టెక్స్ట్ ವಿವರಣೆ.';

  @override
  String get enter4DigitOTP => '4-అంకెల OTPని నమోదు చేయండి';

  @override
  String get enter6DigitOTP => '6-అంకెల OTPని నమోదు చేయండి';

  @override
  String get amount => 'మొత్తం';

  @override
  String get productsApi => 'ఉత్పత్తులు (API)';

  @override
  String get productsMock => 'ఉత్పత్తులు (మాక్)';

  @override
  String get deleteProductTitle => 'ఉత్పత్తిని తొలగించాలా?';

  @override
  String deleteProductContent(String productTitle) {
    return '\'$productTitle\'ని తొలగించాలని మీరు ఖచ్చితంగా అనుకుంటున్నారా?';
  }

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get delete => 'తొలగించు';

  @override
  String get editProduct => 'ఉత్పత్తిని సవరించు';

  @override
  String get createProduct => 'ఉత్పత్తిని సృష్టించు';

  @override
  String get title => 'శీర్షిక';

  @override
  String get titleIsRequired => 'శీర్షిక అవసరం';

  @override
  String get price => 'ధర';

  @override
  String get priceIsRequired => 'ధర అవసరం';

  @override
  String get enterAValidPrice => 'దయచేసి సరైన ధరను నమోదు చేయండి';

  @override
  String get description => 'వివరణ';

  @override
  String get descriptionIsRequired => 'వివరణ అవసరం';

  @override
  String get save => 'సేవ్ చేయి';

  @override
  String get noProductsFound => 'ఉత్పత్తులు కనుగొనబడలేదు. ఒకటి జోడించండి!';

  @override
  String anErrorOccurred(String error) {
    return 'ఒక లోపం సంభవించింది: $error';
  }
}
