import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class LocHomePage extends StatefulWidget {
  const LocHomePage({Key? key}) : super(key: key);

  @override
  State<LocHomePage> createState() => _LocHomePageState();
}

class _LocHomePageState extends State<LocHomePage> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText("welcome"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _changeLanguage(newValue);
                }
              },
              items: <String>['en', 'ar', 'fa']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value == 'en'
                      ? 'English'
                      : value == 'ar'
                          ? 'Arabic'
                          : 'Other'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
      Locales.change(context, languageCode);
    });
  }
}
