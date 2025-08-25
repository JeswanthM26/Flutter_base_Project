import 'package:Retail_Application/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/models/apz_country_code.dart';
import 'package:Retail_Application/themes/apz_app_themes.dart';
import 'package:Retail_Application/themes/common_properties.dart';

class InputWithDropdown extends StatefulWidget {
  final TextEditingController phoneController;
  final String label;
  final String hintText;
  final bool isMandatory;

  const InputWithDropdown({
    super.key,
    required this.phoneController,
    required this.label,
    this.hintText = 'Enter phone number',
    this.isMandatory = false,
  });

  @override
  State<InputWithDropdown> createState() => _InputWithDropdownState();
}

class _InputWithDropdownState extends State<InputWithDropdown> {
  late ApzCountryCode selectedCountryCode;

  @override
  void initState() {
    super.initState();
    // Set India as the default selected country
    selectedCountryCode = sampleCountryCodes.firstWhere((c) => c.code == '+91');
  }

  void _showCountryPicker() async {
    final result = await showModalBottomSheet<ApzCountryCode>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _CountryPicker(),
    );

    if (result != null) {
      setState(() {
        selectedCountryCode = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = inputFieldLabelStyle.copyWith(
      color: AppColors.secondary_text(context),
    );
    final mandatoryStyle = inputFieldLabelStyle.copyWith(
      color: AppColors.semantic_error(context),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: labelStyle,
            children: widget.isMandatory
                ? [TextSpan(text: ' *', style: mandatoryStyle)]
                : [],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown part
            InkWell(
              onTap: _showCountryPicker,
              child: Container(
                height: 52, // Match text form field height
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.input_field_filled(context),
                  borderRadius: BorderRadius.circular(inputFieldBorderRadius),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedCountryCode.flag,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      selectedCountryCode.code,
                      style: countryCodeStyle.copyWith(
                        color: AppColors.secondary_text(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Input part
            Expanded(
              child: TextFormField(
                controller: widget.phoneController,
                keyboardType: TextInputType.phone,
                style: inputFieldHintStyle.copyWith(
                  color: AppColors.primary_text(context),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: inputFieldHintStyle.copyWith(
                    color: AppColors.secondary_text(context),
                  ),
                  filled: true,
                  fillColor: AppColors.input_field_filled(context),
                  contentPadding: inputFieldContentPadding,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(inputFieldBorderRadius),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(inputFieldBorderRadius),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(inputFieldBorderRadius),
                    borderSide: BorderSide(
                      color: AppColors.primary(context),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Private widget for the country picker modal
class _CountryPicker extends StatefulWidget {
  const _CountryPicker();

  @override
  State<_CountryPicker> createState() => __CountryPickerState();
}

class __CountryPickerState extends State<_CountryPicker> {
  late List<ApzCountryCode> filteredCountries;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = sampleCountryCodes;
    searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries = sampleCountryCodes.where((country) {
        return country.name.toLowerCase().contains(query) ||
            country.code.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.container_box(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Country or Code',
                    prefixIcon: Icon(Icons.search, color: AppColors.input_field_filled(context)),
                    filled: true,
                    fillColor: AppColors.input_field_filled(context),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pop(context, country);
                      },
                      leading: Text(country.flag, style: const TextStyle(fontSize: 24)),
                      title: Text(
                        country.name,
                        style: countryCodeStyle.copyWith(color: AppColors.primary_text(context)),
                      ),
                      trailing: Text(
                        country.code,
                        style: countryCodeStyle.copyWith(color: AppColors.secondary_text(context)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
