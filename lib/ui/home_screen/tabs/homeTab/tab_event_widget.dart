import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:flutter/material.dart';



class TabEventWidget extends StatelessWidget {
  String tabName;
  bool selectedTab;
  Color selectedColor;
  Color unSelectedColor;

  TabEventWidget({super.key,
    required this.selectedTab,
    required this.tabName,
    required this.selectedColor,
    required this.unSelectedColor,

  });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: height*.04,
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
      decoration: BoxDecoration(
        color: selectedTab==true
            ?selectedColor
            :unSelectedColor
          ,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color:selectedTab==true
                ?unSelectedColor
                :selectedColor
            ,
            width: 2)

      ),
      child: Center(
        child: Text(
          tabName,style: selectedTab==true
            ?AppStyle.primary14medium.copyWith(
          color: unSelectedColor
        )
            :AppStyle.white14medium.copyWith(
            color: selectedColor
        ),
          textAlign: TextAlign.center,
        ),
      ),

         );
  }
}
