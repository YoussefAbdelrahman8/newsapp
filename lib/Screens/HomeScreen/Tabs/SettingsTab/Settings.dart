import 'package:flutter/material.dart';
import 'package:newsapp/Provider/SettingsProvider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static const id = 1;

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    List<String> items = ["English", "Arabic"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.018,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Language",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          width: width * 0.85,
          child: DropdownButtonFormField<String>(
            hint: const Text("English"),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) => {
              settingsProvider.switchLanguage(
                  SettingsProvider.locale == const Locale("en")
                      ? const Locale("en")
                      : const Locale("en"))
            },
          ),
        )
      ],
    );
  }
}
