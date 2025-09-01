// // import 'package:Retail_Application/ui/components/apz_input_field.dart';
// import 'package:Retail_Application/ui/components/apz_input_field.dart';
// import 'package:flutter/material.dart';

// class InputDemoScreen extends StatefulWidget {
//   const InputDemoScreen({super.key});

//   @override
//   State<InputDemoScreen> createState() => _InputDemoScreenState();
// }

// class _InputDemoScreenState extends State<InputDemoScreen> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _lakhsAmountController = TextEditingController();
//   final _millionsAmountController = TextEditingController();
//   final _disabledController = TextEditingController(text: 'Cannot edit');
//   final _normalController = TextEditingController(text: 'Normal Text');
//   final _readonlyController = TextEditingController(text: 'Read-only Text');
//   final _extendedController = TextEditingController(text: 'Extended Description');
//   final _otp4Controller = TextEditingController();
//   final _otp6Controller = TextEditingController();
//   final _amountController = TextEditingController(text: '1234567');
//   final _dateController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _phoneController.dispose();
//     _lakhsAmountController.dispose();
//     _millionsAmountController.dispose();
//     _disabledController.dispose();
// _normalController.dispose();
//     _readonlyController.dispose();
//     _extendedController.dispose();
//     _otp4Controller.dispose();
//     _otp6Controller.dispose();
//     _amountController.dispose();
//     _dateController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Custom Input Field Demo'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//               children: [
//                 ApzInputField(
//                   label: 'Name',
//                   controller: _nameController,
//                   hintText: 'Enter your full name',
//                   isMandatory: true,
//                   allowAllCaps: true,
//                 ),
//                 const SizedBox(height: 24),
//                 ApzInputField(
//                   label: 'Email Address',
//                   controller: _emailController,
//                   hintText: 'you@example.com',
//                   isEmailFld: true,
//                   isMandatory: true,
//                 ),
//                 const SizedBox(height: 24),
//                 ApzInputField(
//                   label: 'Password',
//                   controller: _passwordController,
//                   hintText: 'Enter your password',
//                   obscureText: true,
//                   isMandatory: true,
//                 ),
//                 const SizedBox(height: 24),
//                 ApzInputField(
//                   label: 'Phone Number',
//                   controller: _phoneController,
//                   hintText: 'Enter your phone number',
//                   onlyNumbers: true,
//                   prefixIcon: const Icon(Icons.phone),
//                 ),
//                 const SizedBox(height: 24),
//                 ApzInputField(
//                   label: 'Amount (Lakhs Format)',
//                   controller: _lakhsAmountController,
//                   hintText: 'Enter amount',
//                   isAmount: true,
//                   amountFormatType: AmountFormatType.lakhs,
//                   prefixIcon: const Icon(Icons.currency_rupee),
//                 ),
//                 const SizedBox(height: 24),
//                 ApzInputField(
//                   label: 'Amount (Millions Format)',
//                   controller: _millionsAmountController,
//                   hintText: 'Enter amount',
//                   isAmount: true,
//                   amountFormatType: AmountFormatType.millions,
//                   prefixIcon: const Icon(Icons.attach_money),
//                 ),
//                 const SizedBox(height: 24),
//                 ApzInputField(
//                   label: 'Disabled Field',
//                   controller: _disabledController,
//                   enabled: false,
//                 ),
//                  const SizedBox(height: 8),
//               ApzInputField(
//                 label: 'Label',
//                 hintText: 'Placeholder',
//                 controller: _normalController,
//               ),
//               const SizedBox(height: 24),

//               //const ApzText('Read-only Input Field', fontWeight: ApzFontWeight.titleBold),
//               const SizedBox(height: 8),
//               ApzInputField(
//                 label: 'Label',
//                 controller: _readonlyController,
//                 fieldType: ApzInputFieldType.readonly,
//               ),
//               const SizedBox(height: 24),

//               //const ApzText('Text Description Input Field', fontWeight: ApzFontWeight.titleBold),
//               const SizedBox(height: 8),
//               ApzInputField(
//                 label: 'Label',
//                 controller: _extendedController,
//                 fieldType: ApzInputFieldType.textDescription,
//                 textDescription: 'This is a text description to provide more information.',
//               ),
//               const SizedBox(height: 24),

//               //const ApzText('4-Digit OTP Input Field', fontWeight: ApzFontWeight.titleBold),
//               const SizedBox(height: 8),
//               ApzInputField(
//                 label: 'Enter 4-Digit OTP',
//                 controller: _otp4Controller,
//                 fieldType: ApzInputFieldType.otp4,
//               ),
//               const SizedBox(height: 24),

//              // const ApzText('6-Digit OTP Input Field', fontWeight: ApzFontWeight.titleBold),
//               const SizedBox(height: 8),
//               ApzInputField(
//                 label: 'Enter 6-Digit OTP',
//                 controller: _otp6Controller,
//                 fieldType: ApzInputFieldType.otp6,
//               ),
//               const SizedBox(height: 24),

//               //const ApzText('Amount Input Field (Lakhs)', fontWeight: ApzFontWeight.titleBold),
              
//               const SizedBox(height: 24),
//               ApzInputField(
//                 label: 'Date',
//                 hintText: 'Select a date',
//               //  minDate: "2020-01-01",
//                 //maxDate: "2030-12-31",
//                // selectionType: SelectionType.range,
//                 controller: _dateController,
//                 fieldType: ApzInputFieldType.datepicker,
//               ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:Retail_Application/core/providers/locale_provider.dart';
import 'package:Retail_Application/l10n/app_localizations.dart';
import 'package:Retail_Application/ui/components/apz_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputFieldPreviewScreen extends StatefulWidget {
  const InputFieldPreviewScreen({super.key});

  @override
  State<InputFieldPreviewScreen> createState() =>
      _InputFieldPreviewScreenState();
}

class _InputFieldPreviewScreenState extends State<InputFieldPreviewScreen> {
  final _normalController = TextEditingController(text: 'Normal Text');
  final _readonlyController = TextEditingController(text: 'Read-only Text');
  final _extendedController =
      TextEditingController(text: 'Extended Description');
  final _otp4Controller = TextEditingController();
  final _otp6Controller = TextEditingController();
  final _amountController = TextEditingController(text: '1234567');

  @override
  void dispose() {
    _normalController.dispose();
    _readonlyController.dispose();
    _extendedController.dispose();
    _otp4Controller.dispose();
    _otp6Controller.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We need this to call the setLocale method
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarTitle),
        actions: [
          // HERE IS THE LANGUAGE SWITCHER WIDGET
          DropdownButton<Locale>(
            underline: const SizedBox(),
            icon: const Icon(Icons.language, color: Colors.white),
            onChanged: (Locale? locale) {
              if (locale != null) {
                localeProvider.setLocale(locale);
              }
            },
            items: L10n.all.map<DropdownMenuItem<Locale>>((locale) {
              final langName = L10n.getLangName(locale.languageCode);
              return DropdownMenuItem(
                value: locale,
                child: Text(langName),
              );
            }).toList(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              ApzInputField(
                label: AppLocalizations.of(context)!.label,
                hintText: AppLocalizations.of(context)!.placeholder,
                controller: _normalController,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              ApzInputField(
                label: AppLocalizations.of(context)!.label,
                controller: _readonlyController,
                fieldType: ApzInputFieldType.readonly,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              ApzInputField(
                label: AppLocalizations.of(context)!.label,
                controller: _extendedController,
                fieldType: ApzInputFieldType.textDescription,
                textDescription:
                    AppLocalizations.of(context)!.textDescription,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              ApzInputField(
                label: AppLocalizations.of(context)!.enter4DigitOTP,
                controller: _otp4Controller,
                fieldType: ApzInputFieldType.otp4,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              ApzInputField(
                label: AppLocalizations.of(context)!.enter6DigitOTP,
                controller: _otp6Controller,
                fieldType: ApzInputFieldType.otp6,
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 8),
              ApzInputField(
                label: AppLocalizations.of(context)!.amount,
                controller: _amountController,
                isAmount: true,
                amountFormatType: AmountFormatType.lakhs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
