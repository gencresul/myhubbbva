import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myhubbbva/pages/home_page.dart';
import 'package:myhubbbva/pages/home_view.dart';
import 'package:myhubbbva/theme_service.dart';
import 'package:myhubbbva/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(
     DevicePreview(
    enabled: true,
    builder: (context) => StartPage()), // Wrap your app
  );
  
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, 
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: HomeView(),
    );
  }
}
