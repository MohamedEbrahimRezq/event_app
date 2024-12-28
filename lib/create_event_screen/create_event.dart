import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_utls/app_colors.dart';
import '../app_utls/app_styles.dart';
import '../tabs/homeTab/tab_event_widget.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = 'createEvent';

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedTab=0;
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    List<String> eventList = [
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
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyle.primary14bold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColorLight),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DefaultTabController(
              length: eventList.length,
              child: TabBar(
                  onTap: (index){
                    selectedTab=index;
                    setState(() {

                    });
                  },
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
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,
                    ),
                    TabEventWidget(selectedTab:
                    selectedTab==1
                        ?true
                        :false
                        ,tabName: eventList[1],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==2
                        ?true
                        :false
                        ,tabName: eventList[2],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==3
                        ?true
                        :false
                        ,tabName: eventList[3],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==4
                        ?true
                        :false
                        ,tabName: eventList[4],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==5
                        ?true
                        :false
                        ,tabName: eventList[5],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==6
                        ?true
                        :false
                        ,tabName: eventList[6],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==7
                        ?true
                        :false
                        ,tabName: eventList[7],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),
                    TabEventWidget(selectedTab:
                    selectedTab==8
                        ?true
                        :false
                        ,tabName: eventList[8],
                      selectedColor: AppColors.primaryColorLight,
                      unSelectedColor: AppColors.white,),

                  ]))
        ],
      ),
    );
  }
}
