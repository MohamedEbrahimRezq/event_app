
import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/tabs/homeTab/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/language_provider.dart';
import '../../provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            height: height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
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
                    initialIndex: 0,
                    length: eventList.length,
                    child: TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        tabs: [
                          TabEventWidget(tabName: eventList[0]),
                          TabEventWidget(tabName: eventList[1]),
                          TabEventWidget(tabName: eventList[2]),
                          TabEventWidget(tabName: eventList[3]),
                        ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
