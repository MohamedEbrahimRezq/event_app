import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reuseable_widgets/custom_text_form_feild.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../home_screen/home_screen.dart';
import '../reuseable_widgets/custom_elevated_button.dart';
import 'create_account.dart';
import 'forget_password.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName = 'loginScreen';
  var emailController = TextEditingController(text: "Mohamed@sasa.com");
  var passwordController = TextEditingController(text: "123456");
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .05,
                ),
                Image(image: AssetImage(AssetsManager.logo)),
                SizedBox(
                  height: height * .01,
                ),
                CustomTextFormField(
                  controller: emailController,
                  validator: (text){
                    if (text == null || text.trim().isEmpty){
                      return "please enter email";
                    }
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if(!emailValid){
                      return "please enter valid email";
                    }
                    return null;
                  },
                  borderColor: AppColors.gray,
                  hintText: AppLocalizations.of(context)!.email,
                  preIcon: Icons.mail_rounded,
                ),
                SizedBox(
                  height: height * .01,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  validator: (text){
                    if (text == null || text.trim().isEmpty){
                      return "please enter rePassword";
                    }
                    if (text.length < 6 ){
                      return " Password should be more than 6 chars";
                    }
                    if( text != passwordController.text){
                      return "password not match";
                    }
                    return null;
                  },
                  borderColor: AppColors.gray,
                  hintText: AppLocalizations.of(context)!.password,
                  preIcon: Icons.lock,
                  afterIcon: Icons.visibility,
                ),
                SizedBox(
                  height: height * .015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, ForgetPassword.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
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
                SizedBox(
                  height: height * .02,
                ),
                CustomElevatedButton(
                  onButtonClicked: (){
                    login();
                  },
                  buttonColor: AppColors.primaryColorLight,
                  buttonName: AppLocalizations.of(context)!.login,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColorLight,
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.havenot_account,
                        style: AppStyle.black16medium),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, CreateAccount.routeName);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.create_account,
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
                SizedBox(
                  height: height * .02,
                ),
                Divider(
                  color: AppColors.primaryColorLight,
                ),
                Text( AppLocalizations.of(context)!.or,style: AppStyle.primary14medium,),
                Divider(
                  color: AppColors.primaryColorLight,
                ),
                SizedBox(
                  height: height * .02,
                ),
                CustomElevatedButton(
                  onButtonClicked: (){
                    //todo : sign in with google

                  },
                  textColor: AppColors.primaryColorLight,
                  buttonColor: Theme.of(context).primaryColorLight,
                  buttonName: AppLocalizations.of(context)!.loginWithGoogle,
                  borderColor: AppColors.primaryColorLight,
                  preIcon: AssetsManager.googleIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true){

    }
  }
}

