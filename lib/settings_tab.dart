import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
static const String routeName='settingScreen';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

String? selectedoption;

List<String> _dropdownItems = [
  'Light',
  'Dark',

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          DropdownButtonFormField<String>(
            padding: EdgeInsets.all(20),
            decoration: InputDecoration(
                label: Text(
                'Language',
                  style: TextStyle(
                  color: Colors.black
                  ),
                )),
            value: selectedoption,
            items: [
              DropdownMenuItem(
                value: 'Arabic',
                child: Text(
                  'Arabic'
                  // AppLocalizations.of(context)!.arabic,
                  // style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              DropdownMenuItem(
                value: 'English',
                child: Text(
                  // AppLocalizations.of(context)!.english,
                  // style: TextStyle(color: Theme.of(context).primaryColorDark),
                  'English'
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedoption = value;
              });
              // if (value == 'Arabic') {
              //   return provider.ChandeLanguage('ar');
              // } else if (value == 'English') {
              //   return provider.ChandeLanguage('en');
              // }
            },
          ),
        ],
      ),

    );
  }
}
