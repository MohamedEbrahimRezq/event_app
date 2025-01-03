import 'package:flutter/material.dart';

import '../../app_utls/app_styles.dart';
class CustomElevatedButton extends StatelessWidget {
  Color buttonColor;
  Color textColor;
  Color borderColor;
  String buttonName;
  String? preIcon;
  Function onButtonClicked;

  CustomElevatedButton({
    required this.onButtonClicked,
    required this.buttonColor,
    required this.buttonName,
    required this.textColor,
    required this.borderColor,
    this.preIcon,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  ElevatedButton(
      onPressed: () {
        onButtonClicked();
      },
      style: ButtonStyle(

        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          side: BorderSide(color:borderColor ),
            borderRadius: BorderRadius.circular(16))),
        padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
        // shape: WidgetStatePropertyAll(),
        backgroundColor: WidgetStatePropertyAll(buttonColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          preIcon!=null?
          Image(image: AssetImage(preIcon!))
          :Text('')
          ,
          SizedBox(width: width*.01,),
          Text(
            buttonName,
            style: AppStyle.white20medium.copyWith(
              color: textColor
            ),
          )
        ],
      ),
    );
  }
}
