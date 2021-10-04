import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myhubbbva/pages/ResponsiveDesignFirstWay.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveDesignFirstWay();
  }
}

 