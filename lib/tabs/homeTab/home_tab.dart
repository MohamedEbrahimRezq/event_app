
import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:event_planning_app/tabs/homeTab/event_widget.dart';
import 'package:event_planning_app/tabs/homeTab/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
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
                DefaultTabController(
                    length: eventList.length,
                    child: TabBar(
                     onTap: (index){
                       selectedTab=index;
                       setState(() {

                       });
                     },
                      labelColor: Colors.red,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        labelPadding: EdgeInsets.all(5),
                        tabs: [
                          TabEventWidget(selectedTab:
                          selectedTab==0
                              ?true
                              :false
                              ,tabName: eventList[0],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,

                          ),
                          TabEventWidget(selectedTab:
                          selectedTab==1
                              ?true
                              :false
                              ,tabName: eventList[1],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,
                          ),
                          TabEventWidget(selectedTab:
                          selectedTab==2
                              ?true
                              :false
                              ,tabName: eventList[2],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==3
                              ?true
                              :false
                              ,tabName: eventList[3],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==4
                              ?true
                              :false
                              ,tabName: eventList[4],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==5
                              ?true
                              :false
                              ,tabName: eventList[5],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==6
                              ?true
                              :false
                              ,tabName: eventList[6],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==7
                              ?true
                              :false
                              ,tabName: eventList[7],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==8
                              ?true
                              :false
                              ,tabName: eventList[8],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                          TabEventWidget(selectedTab:
                          selectedTab==9
                              ?true
                              :false
                              ,tabName: eventList[9],
                            selectedColor: AppColors.white,
                            unSelectedColor: AppColors.primaryColorLight,),
                        ]))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    EventWidget(imageBg: AssetsManager.birthdayBg,eventName: AppLocalizations.of(context)!.birthday,),
                    EventWidget(imageBg: AssetsManager.sportBg,eventName: AppLocalizations.of(context)!.sport,),
                    EventWidget(imageBg: AssetsManager.meetingBg,eventName: AppLocalizations.of(context)!.meeting,),
                    EventWidget(imageBg: AssetsManager.gamingBg,eventName: AppLocalizations.of(context)!.gaming,),
                    EventWidget(imageBg: AssetsManager.eatingBg,eventName: AppLocalizations.of(context)!.eating,),
                    EventWidget(imageBg: AssetsManager.holidayBg,eventName: AppLocalizations.of(context)!.holiday,),
                    EventWidget(imageBg: AssetsManager.exhibitionBg,eventName: AppLocalizations.of(context)!.exhibition,),
                    EventWidget(imageBg: AssetsManager.bookclubBg,eventName: AppLocalizations.of(context)!.book_club,),
                    EventWidget(imageBg: AssetsManager.workshopBg,eventName: AppLocalizations.of(context)!.work_shop,),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
