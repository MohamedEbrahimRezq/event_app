
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/fire_base/firebase_files.dart';
import 'package:event_planning_app/ui/home_screen/tabs/homeTab/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../fire_base/model/events.dart';
import 'event_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}
class _HomeTabState extends State<HomeTab> {
  int selectedTab = 0;
  List<Event> addedEventList = [];
  @override
  Widget build(BuildContext context) {
    getAllEvents();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.work_shop,
    ];
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(
          //   height: height * 0.03,
          // ),
          Container(
            height: height * 0.22,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.welcome_back,
                            style: AppStyle.white14regular,
                          ),
                          Text(
                            'My Name',
                            style: AppStyle.white24bold,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.white,
                              ),
                              Text(
                                AppLocalizations.of(context)!.cairo,
                                style: AppStyle.white14medium,
                              ),
                              Text(
                                ' , ',
                                style: AppStyle.white14medium,
                              ),
                              Text(
                                AppLocalizations.of(context)!.egypt,
                                style: AppStyle.white14medium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Container(
                        height: height * 0.03,
                        width: width * 0.1,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'EN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(top: height * .01, bottom: height * .001),
                  height: height * .05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: eventList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedTab = index;
                            setState(() {});
                          },
                          child: TabEventWidget(
                            selectedTab: selectedTab == index ? true : false,
                            tabName: eventList[index],
                            selectedColor: AppColors.bglight,
                            unSelectedColor: AppColors.primaryColorLight,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: addedEventList.length,
                  itemBuilder: (context, index) {
                    return EventWidget(event: addedEventList[index],);
                  }),
            ),
          )

        ],
      ),
    );
  }
  void getAllEvents()async{

    QuerySnapshot <Event> querySnapshot = await FirebaseFiles.getEventCollection().get();
    addedEventList = querySnapshot.docs.map(
            (doc){
              return doc.data();
            })
        .toList();
    setState(() {
    });
  }
}
