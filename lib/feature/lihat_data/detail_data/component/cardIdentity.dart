import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/resources/resources.dart';

class CardIdentity extends StatelessWidget{
  CardIdentity({
    Key? key,
    required this.marginTop,
    required this.image,
    required this.title,
    required this.content,
    this.onTap,
    this.iconButton,
    this.iconHeight,
    this.iconWidth,
    this.iconPaddingRight,
    this.fontColor,
    this.marginRight,
    this.marginleft,
    this.maxLines,
  }) : super(key: key);

  VoidCallback? onTap;
  double? marginTop; 
  double? marginleft; 
  double? marginRight; 
  Image image; 
  String title;
  String content;
  int? maxLines;
  IconData? iconButton;
  dynamic iconWidth; 
  dynamic iconHeight; 
  dynamic iconPaddingRight; 
  dynamic fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(top: marginTop ?? 0, left: marginleft ?? 0, right: marginRight ?? 0),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: image.image),
              SizedBox(
                width: iconPaddingRight ?? 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: fontColor ?? AppColors.neutral30,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      content,
                      maxLines: maxLines,
                      overflow: maxLines != null ? TextOverflow.ellipsis : null,
                      style: TextStyle(
                        color: fontColor ?? AppColors.secondary5,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                iconButton,
                color: Colors.grey,
                size: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}