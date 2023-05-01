import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale('es'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text('Enable notifications'),
              subtitle: const Text('Enable notifications'),
            ),
            CheckboxListTile(
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: const Text('Enable notifications'),
              activeColor: Colors.black,
            ),
            ListTile(
                title: const Text('What is your birthday?'),
                onTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime(2024));
                  if (kDebugMode) {
                    print(date);
                  }

                  if (context.mounted) {
                    final time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (kDebugMode) {
                      print(time);
                    }
                  }

                  if (context.mounted) {
                    final booking = await showDateRangePicker(
                        builder: (context, child) {
                          return Theme(
                              data: ThemeData(
                                  appBarTheme: const AppBarTheme(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black)),
                              child: child!);
                        },
                        context: context,
                        firstDate: DateTime(1980),
                        lastDate: DateTime(2024));
                    if (kDebugMode) {
                      print(booking);
                    }
                  }
                }),
            ListTile(
              title: const Text('Log Out (ios)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Pls dont go'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log Out (Android)'),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Pls dont go'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log Out (ios / bottom)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Are you sure?'),
                    message: const Text('Please dont go'),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Not log out'),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Yes plz'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const AboutListTile(
              applicationVersion: '1.0',
              applicationLegalese: 'Don\'t copy me',
            ),
          ],
        ),
      ),
    );
  }
}
