class CountryCode {
  final String name;
  final String code;
  final String flag;

  CountryCode({required this.name, required this.code, required this.flag});
}

// Sample list of country codes
final List<CountryCode> sampleCountryCodes = [
  CountryCode(name: 'India', code: '+91', flag: '🇮🇳'),
  CountryCode(name: 'United States', code: '+1', flag: '🇺🇸'),
  CountryCode(name: 'United Kingdom', code: '+44', flag: '🇬🇧'),
  CountryCode(name: 'Australia', code: '+61', flag: '🇦🇺'),
  CountryCode(name: 'Canada', code: '+1', flag: '🇨🇦'),
  CountryCode(name: 'Afghanistan', code: '+93', flag: '🇦🇫'),
  CountryCode(name: 'Albania', code: '+355', flag: '🇦🇱'),
  CountryCode(name: 'Algeria', code: '+213', flag: '🇩🇿'),
];
