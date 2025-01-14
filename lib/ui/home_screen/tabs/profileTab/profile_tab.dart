import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:event_planning_app/provider/language_provider.dart';
import 'package:event_planning_app/provider/user_provider.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profileTab/theme_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../provider/theme_provider.dart';
import '../../../login_screen/login_screen.dart';
import 'language_sheet.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.28,
            decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(65),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage(AssetsManager.routeLogo)),
                      SizedBox(
                        width: width * .03,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProvider.currentUser!.name,
                              style: AppStyle.white24bold,
                            ),
                            Text(
                              overflow: TextOverflow.fade,
                              userProvider.currentUser!.email,
                              style: AppStyle.white16medium,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: themeProvider.appTheme == ThemeMode.dark
                      ? AppStyle.black20w500.copyWith(color: AppColors.white)
                      : AppStyle.black20w500,
                ),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () {
                    showLanguageBottomSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColors.primaryColorLight, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            languageProvider.appLanguage == 'en'
                                ? AppLocalizations.of(context)!.english
                                : AppLocalizations.of(context)!.arabic,
                            style: AppStyle.black20w500
                                .copyWith(color: AppColors.primaryColorLight)),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.primaryColorLight,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: themeProvider.appTheme == ThemeMode.dark
                      ? AppStyle.black20w500.copyWith(color: AppColors.white)
                      : AppStyle.black20w500,
                ),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () {
                    showThemeBottomSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColors.primaryColorLight, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            themeProvider.appTheme == ThemeMode.dark
                                ? AppLocalizations.of(context)!.dark
                                : AppLocalizations.of(context)!.light,
                            style: AppStyle.black20w500
                                .copyWith(color: AppColors.primaryColorLight)),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.primaryColorLight,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.1),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
                    // shape: WidgetStatePropertyAll(),
                    backgroundColor: WidgetStatePropertyAll(AppColors.red),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.login_outlined,
                        color: AppColors.white,
                      ),
                      Text(
                        AppLocalizations.of(context)!.log_out,
                        style: AppStyle.white20medium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
