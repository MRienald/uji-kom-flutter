import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/feature/informasi/informasi_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InformationPage extends StatelessWidget{
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi"
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: GetBuilder<InformationController>(
          builder: (controller) {
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  markers: controller.marker,
                  polylines: controller.polylines,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: controller.kLake,
                  onTap: (argument) {
                    controller.hideButton();
                  },
                  onMapCreated: (GoogleMapController controllerMaps) {
                    controller.mapsController.complete(controllerMaps);
                  },
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background1,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextFormField(
                      controller: controller.textEditingController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        icon: Icon(Icons.search)
                      ),
                      onFieldSubmitted: (value) {
                        controller.searchPlace(value);
                      },
                      onTap: () {
                        controller.hideButton();
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      controller.getCurrentLocation();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.background1.withOpacity(0.7)
                      ),
                      child: Icon(
                        Icons.gps_fixed_rounded,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                ),
                (controller.direction.latitude != 0)
                
                ? Positioned(
                    bottom: 60,
                    right: 60,
                    child: InkWell(
                      onTap: () {
                        controller.getDirection("${controller.myLocation.latitude}, ${controller.myLocation.longitude}", "${controller.direction.latitude}, ${controller.direction.longitude}");
                        // controller.getCurrentLocation();
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.appBar
                        ),
                        child: Text(
                          "Ukur Jarak"
                        )
                      ),
                    ),
                  )
                : SizedBox(),
              ],
            );
          }
        )
      ),
    );
  }
}