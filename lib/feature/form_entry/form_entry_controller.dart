import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_ujikom_test_2/data/local/sqflite/database.dart';
import 'package:flutter_ujikom_test_2/data/local/sqflite/todo_db.dart';
import 'package:flutter_ujikom_test_2/data/remote/base/base_controller.dart';
import 'package:flutter_ujikom_test_2/data/remote/location/location_serveice.dart';
import 'package:flutter_ujikom_test_2/model/pemilih.dart';
import 'package:flutter_ujikom_test_2/routes/page_names.dart';
import 'package:flutter_ujikom_test_2/utils/modal_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class FormEntryController extends BaseController{

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await createDB();
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
  final ImagePicker picker = ImagePicker();
  final List<int> genderValue = [0, 1];
  String gender = 'Laki-laki';
  int genderController = 0;
  List<Pemilih> dataArray = [];
  String? imagePath;
  XFile? image;
  double lat = 0;
  double lng = 0;

  Future<void> getData()async{
    List<Pemilih> data = await TodoDB().fetchAll();
    dataArray = data;
    update();
  }

  void onChangeGender(dynamic value){
    genderController = value;
    if (value == 1) {
      gender = 'Perempuan';
    } else if(value == 0) {
      gender = 'Laki-laki';
    }
    update();
  }

  Future<void> createDB() async{
    Database db = await DatabaseService().database;
    await TodoDB().createTable(db);
  }

  Future<void> insertData(BuildContext context) async{
    String dateString = DateFormat('dd/MM/yyyy').format(formKey.currentState?.value['date']);
    String picture = '';
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
      picturePath: image?.path,
    );
    if (dataArray.where((element) => element.nik == data.nik).length > 0) {
      ModalDialog.YYDialogError(
        context,
        title: 'Duplikasi Data',
        content: 'Data dengan Nomor Induk Kependudukan ${data.nik} sudah terdaftar!'
      );
    }else{
      await TodoDB().create(data: data).then((value) => Get.offAndToNamed(PageName.HOME));
    }
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
    imagePath = imageTemp?.path;
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
    imagePath = imageTemp?.path;
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

}