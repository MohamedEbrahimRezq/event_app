import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app_utls/app_colors.dart';
import '../../app_utls/app_styles.dart';
import '../reuseable_widgets/custom_elevated_button.dart';

class EditeEventWidget extends StatelessWidget {
  static const String routeName = 'editeEvent';

  const EditeEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              },
              child: Image(image: AssetImage(AssetsManager.edite_icon))),
          SizedBox(
            width: width * .02,
          ),
          InkWell(
              onTap: () {
                // todo:  delete the event
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
                      image: AssetImage(AssetsManager.sportBg),
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
                AppLocalizations.of(context)!.loginWithGoogle,
                style: AppStyle.primary20bold,
              ),
              SizedBox(
                height: height * .01,
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: height * .08,
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
                        Text('Date',style: AppStyle.blue16medium,),
                        Text('Time',style: AppStyle.black16medium,),
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
              Text(
                AppLocalizations.of(context)!.description,
                style: AppStyle.black16medium,
              ),

            ],
          )),
    );
  }
}
