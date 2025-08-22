import 'package:flutter/material.dart';
import 'package:Retail_Application/ui/components/input_with_dropdown.dart';

class InputWithDropdownDemoScreen extends StatefulWidget {
  const InputWithDropdownDemoScreen({super.key});

  @override
  State<InputWithDropdownDemoScreen> createState() =>
      _InputWithDropdownDemoScreenState();
}

class _InputWithDropdownDemoScreenState
    extends State<InputWithDropdownDemoScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input with Dropdown Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputWithDropdown(
              label: 'Phone Number',
              phoneController: _phoneController,
              isMandatory: true,
            ),
          ],
        ),
      ),
    );
  }
}
