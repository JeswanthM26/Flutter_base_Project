import 'package:Retail_Application/data/enums/apz_toogel_enum.dart';
import 'package:Retail_Application/data/enums/toggle_enums.dart';
import 'package:Retail_Application/ui/components/apz_toogle_switch.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _toggle1 = false;
  bool _toggle2 = true;
  bool _toggle3 = false;
  bool _toggle4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle Switch Examples"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Small Primary", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("Default:"),
                const SizedBox(width: 8),
                ApzToggleSwitch(
                  value: _toggle1,
                  onChanged: (val) => setState(() => _toggle1 = val),
                  size: ApzToggleSize.small,
                  type: ApzToggleType.primary,
                ),
                const SizedBox(width: 24),
                Text("Disabled:"),
                const SizedBox(width: 8),
                ApzToggleSwitch(
                  value: true,
                  onChanged: (val) {},
                  size: ApzToggleSize.small,
                  type: ApzToggleType.primary,
                  isEnabled: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text("Medium Highlight", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("Default:"),
                const SizedBox(width: 8),
                ApzToggleSwitch(
                  value: _toggle2,
                  onChanged: (val) => setState(() => _toggle2 = val),
                  size: ApzToggleSize.medium,
                  type: ApzToggleType.highlight,
                ),
                const SizedBox(width: 24),
                Text("Disabled:"),
                const SizedBox(width: 8),
                ApzToggleSwitch(
                  value: true,
                  onChanged: (val) {},
                  size: ApzToggleSize.medium,
                  type: ApzToggleType.highlight,
                  isEnabled: false,
                ),
              ],
            ),
             const SizedBox(height: 24),
            Text("Hover Examples", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
             Row(
              children: [
                Text("Hover over me:"),
                const SizedBox(width: 8),
                ApzToggleSwitch(
                  value: _toggle3,
                  onChanged: (val) => setState(() => _toggle3 = val),
                  size: ApzToggleSize.medium,
                  type: ApzToggleType.primary,
                ),
                 const SizedBox(width: 24),
                 Text("And me:"),
                 const SizedBox(width: 8),
                 ApzToggleSwitch(
                  value: _toggle4,
                  onChanged: (val) => setState(() => _toggle4 = val),
                  size: ApzToggleSize.small,
                  type: ApzToggleType.highlight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}