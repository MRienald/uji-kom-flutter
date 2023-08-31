import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_ujikom_test_2/feature/form_entry/form_entry_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:flutter_ujikom_test_2/utils/modal_dialog.dart';
import 'package:flutter_ujikom_test_2/utils/state_handle_widget.dart';
import 'package:flutter_ujikom_test_2/utils/validator.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FormEntryPage extends StatelessWidget{
  const FormEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Entry"
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: GetBuilder<FormEntryController>(
          builder: (controller) {
            return StateHandleWidget(
              // loadingEnabled: controller.isShimmering,
              // loadingView: ProductShimmer(orientation: 'vertical'),
              // emptyEnabled: controller.isEmptyData,
              emptySubtitle: 'txt_empty_place'.tr,
              // errorEnabled: controller.isError,
              errorTitle: 'txt_error_general'.tr,
              onRetryPressed: () {
                // controller.refreshPage();
              },
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: FormBuilder(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FormBuilderTextField(
                          name: 'nik',
                          enabled: !controller.isLoading,
                          decoration: InputDecoration(
                            hintText: "Masukkan NIK",
                            prefixIcon: const Icon(Icons.add_card),
                          ),
                          onChanged: (value) {
                            controller.formKey.currentState?.save();
                          },
                          validator: Validator.nikForm(),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 12,),
                        FormBuilderTextField(
                          name: 'nama',
                          enabled: !controller.isLoading,
                          decoration: InputDecoration(
                            hintText: "Masukkan nama",
                            prefixIcon: const Icon(Icons.person_add),
                          ),
                          validator: Validator.required(),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 12,),
                        FormBuilderTextField(
                          name: 'phone',
                          enabled: !controller.isLoading,
                          decoration: InputDecoration(
                            hintText: "Masukkan nomor telepon",
                            prefixIcon: const Icon(Icons.phone_enabled_rounded),
                          ),
                          validator: FormBuilderValidators.compose([
                            Validator.required(),
                            Validator.numeric('Nomor telepon')
                          ]),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 12,),
                  
                        // radio
                  
                        SizedBox(height: 12,),
                        FormBuilderDateTimePicker(
                          name: 'date',
                          enabled: !controller.isLoading,
                          decoration: InputDecoration(
                            hintText: "Masukkan tanggal",
                            prefixIcon: const Icon(Icons.edit_calendar),
                          ),
                          validator: Validator.required(),
                        ),
                        SizedBox(height: 12,),
                        FormBuilderTextField(
                          name: 'address',
                          enabled: !controller.isLoading,
                          decoration: InputDecoration(
                            hintText: "Masukkan alamat",
                            prefixIcon: const Icon(Icons.location_city_rounded),
                          ),
                          validator: Validator.required(),
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(height: 4,),
                        InkWell(
                          onTap: () => controller.searchLocation(),
                          child: Container(
                            alignment: Alignment.center,
                            height:32,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.blueTag
                            ),
                            child: Text(
                              "Cek Lokasi"
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jenis Kelamin"),
                              SizedBox(height: 4,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 0, 
                                    groupValue: controller.genderValue[controller.genderController], 
                                    onChanged: (value){
                                      controller.onChangeGender(value);
                                    },
                                  ),
                                  Text("L"),
                                  SizedBox(width: 8,),
                                  Radio(
                                    value: 1, 
                                    groupValue: controller.genderValue[controller.genderController], 
                                    onChanged: (value) {
                                      controller.onChangeGender(value);
                                    },
                                  ),
                                  Text("P"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Gambar
                        SizedBox(height: 8,),
                        InkWell(
                          // onTap: () => controller.pickImage(),
                          onTap: () {
                            ModalDialog.YYDialogPickImage(
                              context,
                              controller,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.background4.withOpacity(0.5)
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.camera_enhance_rounded
                                ),
                                VerticalDivider(
                                  color: AppColors.grey,
                                  thickness: 1,
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 60.w,
                                  child: Text(
                                    controller.image?.path ?? "Masukkan Gambar...",
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: (controller.imagePath != null) ? null : AppColors.captionColor.withOpacity(0.8),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4,),
                        (controller.image != null)
                          ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey
                              )
                            ),
                            child: Image.file(
                                File(controller.image?.path ?? '')
                              ),
                            )
                          : SizedBox(),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              if (controller.formKey.currentState !=
                                  null &&
                              controller.formKey.currentState!
                                  .saveAndValidate()){
                                controller.insertData(context);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColors.buttonAlt,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                "Submit"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}