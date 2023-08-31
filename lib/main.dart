import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/data/local/sqflite/database.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:flutter_ujikom_test_2/routes/page_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

void main() async {

  if (Platform.isIOS) {
    Get.put(GetStorage());
  } else {
    // await Initializer.init();
  }

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: AppColors.orange1
          )
        ),
        initialRoute: PageName.HOME,
        getPages: PageRoutes.pages,
        builder: (BuildContext context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? Container(),
          );
        },
      );
    });
  }

}