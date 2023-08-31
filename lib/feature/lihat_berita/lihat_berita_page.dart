import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/feature/lihat_berita/lihat_berita_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:flutter_ujikom_test_2/utils/places_shimmer.dart';
import 'package:flutter_ujikom_test_2/utils/state_handle_widget.dart';
import 'package:flutter_ujikom_test_2/utils/web_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LihatBeritaPage extends StatelessWidget{
  const LihatBeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Berita Terkini"
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: GetBuilder<LihatBeritaController>(
          builder: (controller) {
            return StateHandleWidget(
              loadingEnabled: controller.loadingPage,
              loadingView: PlacesShimmer(),
              emptySubtitle: 'txt_empty_place'.tr,
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
                            onTap: () async{
                              controller.createWebView(
                                controller.dataArray[index].urlNews ?? 'https://news.detik.com/'
                              );
                              Get.to(
                                WebView(
                                  title: "Berita", 
                                  controller: controller
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 8
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 30
                              ),
                              height: 150,
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
                                  Container(
                                    width: 100,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        controller.dataArray[index].urlImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50.w,
                                        child: Text(
                                          controller.dataArray[index].title ?? '',
                                          maxLines: 2,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 48.w,
                                        height: 2,
                                        margin: EdgeInsets.only(top: 8, bottom: 4),
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: 50.w,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Author :',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              controller.dataArray[index].author ?? '',
                                              maxLines: 1,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
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