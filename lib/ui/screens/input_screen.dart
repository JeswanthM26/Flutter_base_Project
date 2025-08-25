import 'package:Retail_Application/ui/components/apz_input_field.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/data/enums/apz_input_field_enums.dart';

class InputDemoScreen extends StatefulWidget {
  const InputDemoScreen({super.key});

  @override
  State<InputDemoScreen> createState() => _InputDemoScreenState();
}

class _InputDemoScreenState extends State<InputDemoScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _lakhsAmountController = TextEditingController();
  final _millionsAmountController = TextEditingController();
  final _disabledController = TextEditingController(text: 'Cannot edit');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _lakhsAmountController.dispose();
    _millionsAmountController.dispose();
    _disabledController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Input Field Demo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                ApzInputField(
                  label: 'Name',
                  controller: _nameController,
                  hintText: 'Enter your full name',
                  isMandatory: true,
                ),
                const SizedBox(height: 24),
                ApzInputField(
                  label: 'Email Address',
                  controller: _emailController,
                  hintText: 'you@example.com',
                  isEmailFld: true,
                  isMandatory: true,
                ),
                const SizedBox(height: 24),
                ApzInputField(
                  label: 'Password',
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  isMandatory: true,
                ),
                const SizedBox(height: 24),
                ApzInputField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  hintText: 'Enter your phone number',
                  onlyNumbers: true,
                  prefixIcon: const Icon(Icons.phone),
                ),
                const SizedBox(height: 24),
                ApzInputField(
                  label: 'Amount (Lakhs Format)',
                  controller: _lakhsAmountController,
                  hintText: 'Enter amount',
                  isAmount: true,
                  amountFormatType: AmountFormatType.lakhs,
                  prefixIcon: const Icon(Icons.currency_rupee),
                ),
                const SizedBox(height: 24),
                ApzInputField(
                  label: 'Amount (Millions Format)',
                  controller: _millionsAmountController,
                  hintText: 'Enter amount',
                  isAmount: true,
                  amountFormatType: AmountFormatType.millions,
                  prefixIcon: const Icon(Icons.attach_money),
                ),
                const SizedBox(height: 24),
                ApzInputField(
                  label: 'Disabled Field',
                  controller: _disabledController,
                  enabled: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
