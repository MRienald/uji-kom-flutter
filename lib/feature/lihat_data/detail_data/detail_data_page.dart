import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/detail_data/component/cardIdentity.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/lihat_data_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class DetailDataPage extends StatelessWidget{
  const DetailDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LihatDataController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Detail Data" 
            ),
          ),
          floatingActionButton: InkWell(
            onTap: () {
              var data = controller.dataArray[controller.index];
              controller.oldImage = data.picture!;
              controller.imagePath = data.picturePath;
              controller.initGender(data.gender);
              Get.offAndToNamed(PageName.UPDATEDATA);
            },
            child: Container(
              height: 18.w,
              width: 18.w,
              decoration: BoxDecoration(
                color: AppColors.background4,
                border: Border.all(
                  width: 2
                ),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Image.asset(
                AppImages.icUpdateData.path
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: 
                    (controller.dataArray[controller.index].gender != 'Perempuan')
                      ? AppImages.icMale.image().image
                      : AppImages.icFemale.image().image,
                    radius: 40,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Pendataan : ${controller.dataArray[controller.index].date}",
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    controller.dataArray[controller.index].name ?? '',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  Text(
                    controller.dataArray[controller.index].nik ?? '',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 40,),
                  CardIdentity(
                    marginTop: 12, 
                    iconPaddingRight: 16.0,
                    image: AppImages.icAboutBlue.image(), 
                    title: "Nomor Telp.", 
                    content: controller.dataArray[controller.index].phone ?? ''
                  ),
                  CardIdentity(
                    marginTop: 12, 
                    iconPaddingRight: 16.0,
                    image: AppImages.icEmailBlue.image(), 
                    title: "Jenis Kelamin", 
                    content: controller.dataArray[controller.index].gender ?? "Laki - laki"
                  ),
                  CardIdentity(
                    marginTop: 12, 
                    iconPaddingRight: 16.0,
                    image: AppImages.icEmailBlue.image(), 
                    title: "Alamat", 
                    content: controller.dataArray[controller.index].address ?? '',
                  ),
                  SizedBox(height: 28,),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gambar",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColors.black,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.memory(
                      base64Decode(controller.dataArray[controller.index].picture ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}