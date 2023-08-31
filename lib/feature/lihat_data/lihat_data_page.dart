import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_data/lihat_data_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:flutter_ujikom_test_2/utils/places_shimmer.dart';
import 'package:flutter_ujikom_test_2/utils/state_handle_widget.dart';
import 'package:get/get.dart';

class LihatDataPage extends StatelessWidget{
  const LihatDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Pemilih"
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: GetBuilder<LihatDataController>(
          builder: (controller) {
            return StateHandleWidget(
              loadingEnabled: controller.loadingPage,
              loadingView: PlacesShimmer(),
              emptyEnabled: (controller.dataArray == []) ? true : false,
              emptySubtitle: 'Data Kosong',
              // errorEnabled: controller.isError,
              errorTitle: 'txt_error_general'.tr,
              onRetryPressed: () {
                // controller.refreshPage();
              },
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.dataArray.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.index = index;
                              Get.toNamed(PageName.DETAILDATA);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 8
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5
                              ),
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppColors.background2,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: 
                                    (controller.dataArray[index].gender != 'Perempuan')
                                      ? AppImages.icMale.image().image
                                      : AppImages.icFemale.image().image,
                                    radius: 30,
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.dataArray[index].name ?? ''
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        controller.dataArray[index].nik ?? ''
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}