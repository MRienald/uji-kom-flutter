import 'package:flutter_ujikom_test_2/feature/lihat_berita/lihat_berita_controller.dart';
import 'package:get/get.dart';

class LihatBeritaBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LihatBeritaController>(LihatBeritaController());
  }
}