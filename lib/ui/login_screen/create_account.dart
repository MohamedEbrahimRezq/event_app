import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app_utls/app_colors.dart';
import '../../app_utls/assets_manager.dart';
import '../reuseable_widgets/custom_elevated_button.dart';
import '../reuseable_widgets/custom_text_form_feild.dart';
import '../home_screen/home_screen.dart';
import 'login_screen.dart';

class CreateAccount extends StatelessWidget {
  static const String routeName = 'register';
  var nameController = TextEditingController(text: "Mohamed");
  var emailController = TextEditingController(text: "Mohamed@sasa.com");
  var passwordController = TextEditingController(text: "123456");
  var rePasswordController = TextEditingController(text: "123456");
  var formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
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
                  controller: nameController,
                  validator: (text){
                    if (text == null || text.trim().isEmpty){
                      return "please enter name";
                    }
                    return null;
                  },
                  borderColor: AppColors.gray,
                  hintText: AppLocalizations.of(context)!.name,
                  preIcon: Icons.person,
                ),
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
                  preIcon: Icons.lock,
                ),
                SizedBox(
                  height: height * .015,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  validator: (text){
                    if (text == null || text.trim().isEmpty){
                      return "please enter password";
                    }
                    if (text.length < 6 ){
                      return " Password should be more than 6 chars";
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
                CustomTextFormField(
                  controller: rePasswordController,
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
                  hintText: AppLocalizations.of(context)!.re_password,
                  preIcon: Icons.lock,
                  afterIcon: Icons.visibility,
                ),
                SizedBox(
                  height: height * .015,
                ),
                CustomElevatedButton(
                  onButtonClicked: (){
                    register();
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
      ),

    );
  }

  void register() async {
    if(formKey.currentState?.validate()== true){
          try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print ('Account created');
      print(credential.user?.uid??" ");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    }
  }
}
