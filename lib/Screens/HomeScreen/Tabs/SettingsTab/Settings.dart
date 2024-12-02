import 'package:flutter/material.dart';
import 'package:newsapp/Provider/SettingsProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  static const id = 1;

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    List<Map<String, String>> items = [
      {"value": "en", "label": AppLocalizations.of(context)!.english},
      {"value": "ar", "label": AppLocalizations.of(context)!.arabic},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.018,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            AppLocalizations.of(context)!.language,
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
            hint: Text(AppLocalizations.of(context)!.english),
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
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item["value"], // Pass the language code as the value
                child: Text(item["label"]!), // Display the localized label
              );
            }).toList(),
            onChanged: (value) {
              if (value == "en") {
                settingsProvider.switchLanguage(const Locale("en"));
              } else if (value == "ar") {
                settingsProvider.switchLanguage(const Locale("ar"));
              }
            },
          ),
        )
      ],
    );
  }
}
