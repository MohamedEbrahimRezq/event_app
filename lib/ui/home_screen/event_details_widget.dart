import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/home_screen/tabs/homeTab/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../app_utls/app_colors.dart';
import '../../app_utls/app_styles.dart';
import '../../provider/event_list_provider.dart';
import '../reuseable_widgets/custom_elevated_button.dart';
import 'edite_event_widget.dart';

class EventDetailsWidget extends StatelessWidget {
  static const String routeName = 'eventDetails';

  const EventDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    EventListProvider eventListProvider = Provider.of<EventListProvider>(context);
    EventWidget args = ModalRoute.of(context)?.settings.arguments as EventWidget ;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          AppLocalizations.of(context)!.eventDetails,
          style: AppStyle.primary14bold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColorLight),
        actions: [
          InkWell(
              onTap: () {
                // todo: navigate to edite the event
                Navigator.of(context).pushNamed(EditeEventWidget.routeName,
                arguments: EventWidget(event: args.event)
                );
              },
              child: Image(image: AssetImage(AssetsManager.edite_icon))),
          SizedBox(
            width: width * .02,
          ),
          InkWell(
              onTap: () {
                // todo:  delete the event
                eventListProvider.deleteEvent(args.event);
                eventListProvider.getAllEvents();
                eventListProvider.getFavoriteEvents();
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              child: Image(image: AssetImage(AssetsManager.delete_icon))),
          SizedBox(
            width: width * .05,
          )
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: height * .25,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(args.event.image),
                      fit: BoxFit.fill),
                  border:
                      Border.all(width: 2, color: AppColors.primaryColorLight),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                // toDo : Event title
                args.event.title,
                style: AppStyle.primary20bold,
              ),
              SizedBox(
                height: height * .01,
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: height * .09,
                width: width,
                decoration: BoxDecoration(
                  border:
                  Border.all(width: 1, color: AppColors.primaryColorLight),
                  borderRadius: BorderRadius.circular(16),
                  
                ),
                child: Row(
                  children: [
                    Image(image: AssetImage(AssetsManager.date_Icon)),
                    SizedBox(width: width*.02,),
                    Column(
                      children: [
                        //todo: event date
                        Row(
                          children: [
                            Text(args.event.dateTime.day.toString(), style: AppStyle.blue16medium,),
                            Text("- ", style: AppStyle.blue16medium,),
                            Text(args.event.dateTime.month.toString(), style: AppStyle.blue16medium,),
                            Text('- ', style: AppStyle.blue16medium,),
                            Text(args.event.dateTime.year.toString(), style: AppStyle.blue16medium,),
                          ],
                        ),

                        // todo: event time
                        Text(args.event.time,style: AppStyle.blue16medium,),
                      ],
                    )
                  ],
                ),

              ),
              SizedBox(
                height: height * .015,
              ),
              CustomElevatedButton(
                onButtonClicked: () {

                },
                preIcon: AssetsManager.locationIcon,
                buttonColor: AppColors.bglight,
                buttonName: AppLocalizations.of(context)!.location,
                textColor: AppColors.blue,
                borderColor: AppColors.blue,
                afterIcon: AssetsManager.arrow_icon,

              ),
              SizedBox(
                height: height * .01,
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: height * .25,
                width: width,
                decoration: BoxDecoration(
                  border:
                  Border.all(width: 2, color: AppColors.primaryColorLight),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(
                height: height * .005,
              ),
              Text(
                AppLocalizations.of(context)!.description,
                style: AppStyle.black16medium,
              ),
              SizedBox(
                height: height * .005,
              ),

              //toDo: description
              Text(
                args.event.description,
                style: AppStyle.black16medium,




              ),

            ],
          )),
    );
  }
}
