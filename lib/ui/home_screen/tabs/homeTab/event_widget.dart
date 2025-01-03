import 'package:flutter/cupertino.dart';
import '../../../../app_utls/app_colors.dart';
import '../../../../app_utls/app_styles.dart';
import '../../../../fire_base/model/events.dart';



class EventWidget extends StatelessWidget {
 Event event;
 EventWidget({ required this.event});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      height: height*.25,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(event.image!),fit: BoxFit.fill),
        border: Border.all(width: 2,color: AppColors.primaryColorLight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  event.dateTime.day.toString(),
                  textAlign: TextAlign.center,
                  style: AppStyle.primary20bold,),
                Text(
                  event.dateTime.month.toString(),
                  style: AppStyle.primary14bold,
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.bglight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.eventName!,
                  textAlign: TextAlign.center,
                  style: AppStyle.primary20bold,),
                Icon(CupertinoIcons.heart,color: AppColors.primaryColorLight,size: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
