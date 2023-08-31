import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_ujikom_test_2/data/local/sqflite/todo_db.dart';
import 'package:flutter_ujikom_test_2/data/remote/base/base_controller.dart';
import 'package:flutter_ujikom_test_2/data/remote/location/location_serveice.dart';
import 'package:flutter_ujikom_test_2/model/pemilih.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:flutter_ujikom_test_2/utils/modal_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class LihatDataController extends BaseController{

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getData();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  @override
  // TODO: implement statusData
  get statusData => throw UnimplementedError();

  @override
  // TODO: implement storageName
  String get storageName => throw UnimplementedError();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  List<Pemilih> dataArray = [];
  final List<int> genderValue = [0, 1];
  final ImagePicker picker = ImagePicker();
  String? imagePath;
  XFile? image;
  String oldImage = '';
  String gender = 'Laki-laki';
  int genderController = 0;
  int index = 0;
  double lat = 0;
  double lng = 0;
  bool loadingPage = false;

  void onChangeGender(dynamic value){
    genderController = value;
    if (value == 1) {
      gender = 'Perempuan';
    } else if(value == 0) {
      gender = 'Laki-laki';
    }
    update();
  }

  void initGender(dynamic value){
    gender = value;
    if (value == 'Perempuan') {
      genderController = 1;
    } else if(value == 'Laki-laki') {
      genderController = 0;
    }
    update();
  }

  Future<void> getData()async{
    loadingPage = true;
    List<Pemilih> data = await TodoDB().fetchAll();
    dataArray = data;
    loadingPage = false;
    update();
  }

  Future<void> searchLocation() async {
    formKey.currentState!.save();
    String? address = formKey.currentState?.value['address'];
    var place;
    if (address != null) {
      place = await LocationService().getPlace(address);
      lat = place['geometry']['location']['lat'];
      lng = place['geometry']['location']['lng'];
    }
  }

  Future<void> pickImageFromGalerry() async {
    XFile? imageTemp = await picker.pickImage(source: ImageSource.gallery);
    if (imageTemp != null) {
      File fileImage = File(imageTemp.path);
      FlutterImageCompress.compressAndGetFile(
        fileImage.absolute.path,
        fileImage.path + 'compressed.jpg',
        minHeight: 600,
        minWidth: 600,
        quality: 70
      ).then((value) {
        image = value;
        update();
      });
      imagePath = image?.name;
    }
    update();
  }

  Future<void> pickImageFromCamera() async {
    XFile? imageTemp = await picker.pickImage(source: ImageSource.camera);
    if (imageTemp != null) {
      File fileImage = File(imageTemp.path);
      FlutterImageCompress.compressAndGetFile(
        fileImage.absolute.path,
        fileImage.path + 'compressed.jpg',
        minHeight: 600,
        minWidth: 600,
        quality: 70
      ).then((value) {
        image = value;
        update();
      });
      imagePath = image?.name;
    }
    update();
  }

  Future<void> updateData() async{
    String dateString = DateFormat('dd/MM/yyyy').format(formKey.currentState?.value['date']);
    String picture = oldImage;
    if (image != null) {
      final bytes = File(image!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      picture = img64.toString();
    }
    await searchLocation();
    Pemilih data = Pemilih(
      name: formKey.currentState?.value['nama'],
      nik: formKey.currentState?.value['nik'],
      phone: formKey.currentState?.value['phone'],
      gender: gender,
      date: dateString,
      address: formKey.currentState?.value['address'],
      latAddress: lat,
      lngAddres: lng,
      picture: picture,
    );
    
    await TodoDB().updateData(id: dataArray[index].id!, dataUpdate: data).then((value) async{
      await getData();
      Get.offAndToNamed(PageName.DETAILDATA);
  });
    update();
  }
  
}