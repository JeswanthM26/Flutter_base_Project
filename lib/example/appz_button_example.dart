import 'package:Retail_Application/data/enums/apz_buttons_enum.dart';
import 'package:flutter/material.dart';
import 'package:Retail_Application/ui/components/appz_button.dart';

class AppzButtonExample extends StatelessWidget {
  const AppzButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppzButton Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Primary Buttons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Small'),
            AppzButton(
              label:
                  'Primary Small butoon is a large buttg vcffvgfhhbhfb gfgrgyt',
              appearance: AppzButtonAppearance.primary,
              size: AppzButtonSize.small,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text('Large'),
            AppzButton(
              label: 'Primary Large',
              appearance: AppzButtonAppearance.primary,
              size: AppzButtonSize.large,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text('With Leading Icon'),
            AppzButton(
              label: 'Icon',
              appearance: AppzButtonAppearance.primary,
              iconLeading: Icons.add,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text('With Trailing Icon'),
            AppzButton(
              label: 'Icon',
              appearance: AppzButtonAppearance.primary,
              iconTrailing: Icons.arrow_forward,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text('Disabled'),
            AppzButton(
              label: 'Disabled',
              appearance: AppzButtonAppearance.primary,
              disabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
            const Text('Secondary Buttons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AppzButton(
              label: 'Secondary',
              appearance: AppzButtonAppearance.secondary,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
            const Text('Tertiary Buttons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AppzButton(
              label: 'Tertiary',
              appearance: AppzButtonAppearance.tertiary,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            const Text('Tertiary with Icon'),
            AppzButton(
              label: 'Tertiary',
              appearance: AppzButtonAppearance.tertiary,
              iconLeading: Icons.link,
              onPressed: () {},
              textColor: Colors.yellowAccent,
            ),
            const SizedBox(height: 32),
            const Text('Disabled Buttons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AppzButton(
              label: 'Primary Disabled',
              appearance: AppzButtonAppearance.primary,
              size: AppzButtonSize.large,
              disabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppzButton(
              label: 'Secondary Disabled',
              appearance: AppzButtonAppearance.secondary,
              disabled: true,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppzButton(
              label: 'Tertiary Disabled',
              appearance: AppzButtonAppearance.tertiary,
              disabled: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
