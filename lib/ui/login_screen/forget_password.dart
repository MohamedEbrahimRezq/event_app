import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app_utls/app_colors.dart';
import '../../app_utls/app_styles.dart';
import '../reuseable_widgets/custom_text_form_feild.dart';
import '../reuseable_widgets/custom_elevated_button.dart';
import 'create_account.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = 'forgetPassword';
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text( AppLocalizations.of(context)!.forget_password,style: AppStyle.white20medium,),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * .015,
              ),
              Image(image: AssetImage(AssetsManager.forgetPassword),fit: BoxFit.fill,),
              SizedBox(
                height: height * .02,
              ),
              CustomTextFormField(
                borderColor: AppColors.gray,
                hintText: AppLocalizations.of(context)!.email,
                preIcon: Icons.lock,
              ),
              SizedBox(
                height: height * .02,
              ),
              CustomElevatedButton(
                onButtonClicked: (){
                  Navigator.pushReplacementNamed(context, CreateAccount.routeName);
                },
                buttonColor: AppColors.primaryColorLight,
                buttonName: AppLocalizations.of(context)!.reset_password,
                textColor: AppColors.white,
                borderColor: AppColors.primaryColorLight,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
