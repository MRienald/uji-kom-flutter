// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_ujikom_test_2/feature/form_entry/form_entry_controller.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';
import 'package:sizer/sizer.dart';

class ModalDialog {
  
  static YYDialog YYDialogPickImage(
    BuildContext context,
    controller,
  ) {
    return YYDialog().build(context)
      ..width = 70.w
      ..height = 32.h
      ..backgroundColor = AppColors.background1.withOpacity(0.8)
      ..borderRadius = 10.0
      ..showCallBack = () {
        print("showCallBack invoke");
      }
      ..dismissCallBack = () {
        print("dismissCallBack invoke");
      }
      ..widget(Padding(
        padding: EdgeInsets.only(top: 10.w),
        child: Text(
          "Tambah Gambar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(
          top: 10.w,
          left: 8.w,
          right: 8.w,
        ),
        child: Text(
          "Silahkan tambahkan gambar melalui Gallery atau ambil gambar baru dengan Camera!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ))
      ..widget(Container(
        margin: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 8.w
        ),
        height: 15.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.pickImageFromGalerry();
                Navigator.pop(context);
              },
              child: Container(
                height: 12.w,
                width: 21.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.appBar
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(
                  Icons.phone_android_rounded
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.pickImageFromCamera();
                Navigator.pop(context);
              },
              child: Container(
                height: 12.w,
                width: 21.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.appBar
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(
                  Icons.camera_alt_rounded
                ),
              ),
            ),
          ],
        ),
      ))
      ..animatedFunc = (child, animation) {
        return ScaleTransition(
          child: child,
          scale: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      }
      ..show();
  }

  static YYDialog YYDialogError(
    BuildContext context,
    {
      String? title,
      String? content
    }
  ) {
    return YYDialog().build(context)
      ..width = 70.w
      ..height = 29.h
      ..backgroundColor = AppColors.background1.withOpacity(0.9)
      ..borderRadius = 10.0
      ..showCallBack = () {
        print("showCallBack invoke");
      }
      ..dismissCallBack = () {
        print("dismissCallBack invoke");
      }
      ..widget(Padding(
        padding: EdgeInsets.only(top: 10.w),
        child: Image.asset(
          AppImages.icWarningState.path,
          width: 50,
          height: 50,
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(top: 5.w),
        child: Text(
          title ?? '',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ))
      ..widget(Padding(
        padding: EdgeInsets.only(
          top: 5.w,
          left: 4.w,
          right: 4.w,
        ),
        child: Text(
          content ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ))
      ..animatedFunc = (child, animation) {
        return ScaleTransition(
          child: child,
          scale: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      }
      ..show();
  }

}