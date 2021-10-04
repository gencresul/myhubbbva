import 'package:flutter/material.dart';
import 'package:myhubbbva/theme_service.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = ThemeService().thememods;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Garanti BBVA'),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Karanlık mod',
                style: TextStyle(
                    color: Theme.of(context).textTheme.caption!.color ??
                        Color(0xFFDDDDDD),
                    fontWeight: FontWeight.w700),
              ),
              Switch.adaptive(
                activeColor: Colors.green,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    ThemeService().switchTheme();
                    isSwitched = ThemeService().thememods;
                  });
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
