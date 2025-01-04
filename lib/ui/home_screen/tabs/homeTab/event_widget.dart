import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app_utls/app_colors.dart';
import '../../../../app_utls/app_styles.dart';
import '../../../../fire_base/model/events.dart';

class EventWidget extends StatefulWidget {
  Event event;

  EventWidget({required this.event});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      height: height * .25,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(widget.event.image), fit: BoxFit.fill),
        border: Border.all(width: 2, color: AppColors.primaryColorLight),
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
                  widget.event.dateTime.day.toString(),
                  textAlign: TextAlign.center,
                  style: AppStyle.primary20bold,
                ),
                Text(
                  DateFormat('MMM').format( widget.event.dateTime),
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
                  widget.event.eventName,
                  textAlign: TextAlign.center,
                  style: AppStyle.primary20bold,
                ),
                InkWell(
                  onTap: () {
                    if (widget.event.isfavorite == false) {
                      widget.event.isfavorite = true;
                      print('is favorite');
                    } else {
                      widget.event.isfavorite = false;
                      print('not favorite');
                    }
                    setState(() {});
                  },
                  child: Icon(  widget.event.isfavorite == true
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                    color: AppColors.primaryColorLight,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
