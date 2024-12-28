import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/reuseable_widgets/custom_elevated_button.dart';
import 'package:event_planning_app/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_utls/app_colors.dart';
import '../app_utls/assets_manager.dart';
import '../reuseable_widgets/custom_text_form_feild.dart';
import '../home_screen/home_screen.dart';

class CreateAccount extends StatelessWidget {
  static const String routeName = 'register';
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text( AppLocalizations.of(context)!.register,style: AppStyle.white20medium,),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .05,
              ),
              Image(image: AssetImage(AssetsManager.logo)),
              SizedBox(
                height: height * .01,
              ),
              CustomTextFormField(
                borderColor: AppColors.gray,
                hintText: AppLocalizations.of(context)!.name,
                preIcon: Icons.person,
              ),
              SizedBox(
                height: height * .01,
              ),
              CustomTextFormField(
                borderColor: AppColors.gray,
                hintText: AppLocalizations.of(context)!.email,
                preIcon: Icons.lock,
              ),
              SizedBox(
                height: height * .015,
              ),
              CustomTextFormField(
                borderColor: AppColors.gray,
                hintText: AppLocalizations.of(context)!.password,
                preIcon: Icons.lock,
                afterIcon: Icons.visibility,
              ),
              SizedBox(
                height: height * .015,
              ),
              CustomTextFormField(
                borderColor: AppColors.gray,
                hintText: AppLocalizations.of(context)!.re_password,
                preIcon: Icons.lock,
                afterIcon: Icons.visibility,
              ),
              SizedBox(
                height: height * .015,
              ),
              CustomElevatedButton(
                onButtonClicked: (){
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                buttonColor: AppColors.primaryColorLight,
                buttonName: AppLocalizations.of(context)!.create_account,
                textColor: AppColors.white,
                borderColor: AppColors.primaryColorLight,
              ),
              SizedBox(
                height: height * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.have_Account,
                      style: AppStyle.black16medium),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: AppStyle.primary14bold.copyWith(
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColorLight,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),

    );
  }
}
