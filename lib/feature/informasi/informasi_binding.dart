

import 'package:flutter_ujikom_test_2/feature/informasi/informasi_controller.dart';
import 'package:get/get.dart';

class InformationBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<InformationController>(InformationController());
  }
}