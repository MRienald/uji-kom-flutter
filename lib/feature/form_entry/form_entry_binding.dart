import 'package:flutter_ujikom_test_2/feature/form_entry/form_entry_controller.dart';
import 'package:get/get.dart';

class FormEntryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<FormEntryController>(FormEntryController());
  }
}