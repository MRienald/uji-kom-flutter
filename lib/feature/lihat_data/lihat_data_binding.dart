import 'package:flutter_ujikom_test_2/feature/lihat_data/lihat_data_controller.dart';
import 'package:get/get.dart';

class LihatDataBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LihatDataController>(LihatDataController());
  }
}