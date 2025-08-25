import 'package:flutter/material.dart';
import '../ui/components/apz_alert.dart'; // Adjust path as needed

class AppzAlertExample extends StatelessWidget {
  const AppzAlertExample({Key? key}) : super(key: key);

  void _handleButtonPressed(String label) {
    print('Button pressed: $label');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppzAlert Example'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Show Success Alert'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => ApzAlert(
                            title: 'Title',
                            message:
                                'You can insert a description for the message here. The text relates to the action that has been performed.',
                            messageType: ApzAlertMessageType.info,
                            alertType: ApzAlertType.primary,
                            buttons: ['LABEL', 'LABEL'],
                            onButtonPressed: (label) {
                              print('$label pressed');
                            },
                          ));
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Show Error Alert with Two Buttons'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => ApzAlert(
                      title: 'Error',
                      message: 'Something went wrong. Please try again.',
                      messageType: ApzAlertMessageType.error,
                      alertType: ApzAlertType.secondary,
                      buttons: ['Retry', 'Cancel'],
                      onButtonPressed: _handleButtonPressed,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Show Info Alert'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => ApzAlert(
                      title: 'Information',
                      message: 'This is an informational alert.',
                      messageType: ApzAlertMessageType.info,
                      alertType: ApzAlertType.tertiary,
                      buttons: ['Got it'],
                      onButtonPressed: _handleButtonPressed,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Show Warning Alert'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => ApzAlert(
                      title: 'Warning',
                      message: 'Please pay attention to this warning.',
                      messageType: ApzAlertMessageType.warning,
                      alertType: ApzAlertType.primary,
                      buttons: ['Understood', 'Dismiss'],
                      onButtonPressed: _handleButtonPressed,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
