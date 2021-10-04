import 'package:flutter/material.dart';
import 'package:myhubbbva/pages/settings_page.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:myhubbbva/themes.dart';
import 'package:myhubbbva/theme_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ButtonState stateOnlyText = ButtonState.idle;
  final _tutar = TextEditingController();

  void onPressedCustomButton() {
    setState(() {
      switch (stateOnlyText) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.fail;
          break;
        case ButtonState.success:
          stateOnlyText = ButtonState.idle;
          break;
        case ButtonState.fail:
          stateOnlyText = ButtonState.success;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            title: Text('Garanti BBVA Kredim'),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Icon(
                      Icons.settings,
                      size: 26.0,
                    ),
                  )),
            ]),
        body: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Theme.of(context).textTheme.caption!.color),
                      controller: _tutar,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Kredi Tutarı",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color ??
                                    Color(0xFFDDDDDD))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).textTheme.bodyText2!.color ??
                                    Color(0xFFDDDDDD),
                          ),
                        ),
                        labelStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText2!.color),
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Kredi tutarı giriniz';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: ProgressButton.icon(
                      iconedButtons: {
                        ButtonState.idle: IconedButton(
                            text: "Hesapla",
                            icon: Icon(Icons.send, color: Colors.white),
                            color: Colors.deepPurple.shade500),
                        ButtonState.loading: IconedButton(
                            text: "Yükleniyor...",
                            color: Colors.deepPurple.shade700),
                        ButtonState.fail: IconedButton(
                            text: "Hata",
                            icon: Icon(Icons.cancel, color: Colors.white),
                            color: Colors.red.shade300),
                        ButtonState.success: IconedButton(
                            text: "Hesapla",
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                            color: Colors.green.shade400)
                      },
                      onPressed: onPressedCustomButton,
                      state: stateOnlyText,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
