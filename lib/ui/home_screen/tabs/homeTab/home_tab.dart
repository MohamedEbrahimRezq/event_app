import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/provider/event_list_provider.dart';
import 'package:event_planning_app/ui/home_screen/tabs/homeTab/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'event_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late EventListProvider eventListProvider;

  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    if (eventListProvider.addedEventList.isEmpty) {
      eventListProvider.getAllEvents();
    }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                      itemCount: eventListProvider.eventList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            eventListProvider.changeSelectedTab(index);
                            setState(() {});
                          },
                          child: TabEventWidget(
                            selectedTab: eventListProvider.selectedTab == index
                                ? true
                                : false,
                            tabName: eventListProvider.eventList[index],
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
                child: eventListProvider.filteredEventList.isEmpty
                    ? Center(
                        child: Text(
                          'No Event Added Yet.',
                          style: AppStyle.black16medium,
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: eventListProvider.filteredEventList.length,
                        itemBuilder: (context, index) {
                          return EventWidget(
                            event: eventListProvider.filteredEventList[index],
                          );
                        })),
          )
        ],
      ),
    );
  }

  void emptyAllEvents() {}
}
