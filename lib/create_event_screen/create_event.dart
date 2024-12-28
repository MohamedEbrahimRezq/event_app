import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_utls/app_colors.dart';
import '../app_utls/app_styles.dart';
import '../reuseable_widgets/custom_text_form_feild.dart';
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
    var width = MediaQuery.of(context).size.width;
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
    List<String> eventImageList = [
      AssetsManager.sportBg,
      AssetsManager.birthdayBg,
      AssetsManager.meetingBg,
      AssetsManager.gamingBg,
      AssetsManager.eatingBg,
      AssetsManager.holidayBg,
      AssetsManager.exhibitionBg,
      AssetsManager.bookclubBg,
      AssetsManager.workshopBg,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Container(
                height: height*.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(eventImageList[selectedTab]),fit: BoxFit.fill,),
                ),),

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
                          unSelectedColor: AppColors.bglight,
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

                      ])),
              Text(AppLocalizations.of(context)!.title,style: AppStyle.black16medium,),
              SizedBox(height: height*.01,),
              CustomTextFormField(
                borderColor: AppColors.gray,
                preIcon: Icons.edit_note_outlined,
                hintText: AppLocalizations.of(context)!.title,
              ),
              SizedBox(height: height*.01,),
              Text(AppLocalizations.of(context)!.description,style: AppStyle.black16medium,),
              SizedBox(height: height*.015,),
              CustomTextFormField(
                borderColor: AppColors.gray,
                hintText: AppLocalizations.of(context)!.description,
                numLines: 5,
              ),
              SizedBox(height: height*.015,),
              Row(
                children: [
                  Icon(Icons.date_range_outlined),
                  SizedBox(width: width*.015,),
                  Text(AppLocalizations.of(context)!.eventDate,style: AppStyle.black16medium,),
                  Spacer(),
                  Text(AppLocalizations.of(context)!.chooseDate,style: AppStyle.primary14bold,),
                ],
              ),
              SizedBox(height: height*.015,),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: width*.015,),
                  Text(AppLocalizations.of(context)!.eventTime,style: AppStyle.black16medium,),
                  Spacer(),
                  Text(AppLocalizations.of(context)!.chooseTime,style: AppStyle.primary14bold,),
                ],
              ),
              SizedBox(height: height*.015,),
              Text(AppLocalizations.of(context)!.location,style: AppStyle.black16medium,),
            ],
          ),
        ),
      ),
    );
  }
}
