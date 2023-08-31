import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/feature/form_entry/form_entry_controller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class Validator {
  static FormFieldValidator<T> required<T>() {
    return FormBuilderValidators.required(errorText: 'Form tidak boleh kosong!');
  }
  
  static FormFieldValidator<String> emailForm<T>() {
    return FormBuilderValidators.email(errorText: 'Format email masih salah!');
  }

  static FormFieldValidator<String> nikForm<T>() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'Form tidak boleh kosong!'),
      FormBuilderValidators.numeric(errorText: 'Format NIK masih salah'),
      FormBuilderValidators.minLength(16, errorText: 'Format NIK harus berisikan minimal 16 karakter'),
    ]);
  }

  static FormFieldValidator<String> minLenghtForm<T>(int lenght) {
    return FormBuilderValidators.minLength(lenght, errorText: 'inputan harus berisikan minimal $lenght karakter');
  }

  static FormFieldValidator<String> numeric<T>(String label) {
    return FormBuilderValidators.numeric(errorText: '$label harus berupa angka');
  }

}
