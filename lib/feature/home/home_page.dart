import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ujikom_test_2/data/remote/api_service.dart';
import 'package:flutter_ujikom_test_2/feature/home/home_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:flutter_ujikom_test_2/utils/state_handle_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: GetBuilder<HomeController>(
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
                    margin: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 6.h, bottom: 40),
                          child: Image.asset(
                            AppImages.imgLogoKpu.path,
                            height: 150,
                            width: 150,
                          ),
                        ),
                        GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 68,
                          ),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 28,
                          crossAxisCount: 2,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(PageName.INFORMATION);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.orange1,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.not_listed_location_rounded,
                                      size: 36,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "Pemetaan",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.white
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(PageName.FORMENTRY),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.orange1,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.move_to_inbox_rounded,
                                      size: 36,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "Form Entry",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.white
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(PageName.LIHATDATA);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.orange1,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.nature_people_rounded,
                                      size: 36,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "Lihat Data",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.white
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(PageName.BERITA);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.orange1,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.newspaper_rounded,
                                      size: 36,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "Berita",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.white
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),                        
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 29.w,
                            width: 29.w,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.orange1,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  size: 36,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  "Keluar",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),                                          
                      ],
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