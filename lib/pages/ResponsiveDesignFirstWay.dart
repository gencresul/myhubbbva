import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myhubbbva/controllers/home_controller.dart';
import 'package:myhubbbva/pages/home_page.dart';

class ResponsiveDesignFirstWay extends GetResponsiveView<HomeController> {
  @override
  Widget builder() {
    if (screen.isPhone) {
      return HomePage();
    } else if (screen.isDesktop) {
      return renderWidget(
          iconData: Icons.desktop_windows, color: Colors.red, text: 'Desktop');
    } else if (screen.isTablet) {
      return renderWidget(
          iconData: Icons.tablet, color: Colors.green, text: 'Tablet');
    } else if (screen.isWatch) {
      return renderWidget(
          iconData: Icons.watch, color: Colors.orange, text: 'Watch');
    }
    return renderWidget(
        iconData: Icons.phone, color: Colors.blue, text: 'Phone');
  }

  renderWidget(
      {required IconData iconData,
      required Color color,
      required String text}) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 100,
          color: color,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 40),
        )
      ],
    );
  }
}