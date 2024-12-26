import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:event_planning_app/tabs/profileTab/theme_sheet.dart';
import 'package:event_planning_app/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: themeProvider.appTheme == ThemeMode.dark
                ? AppStyle.black20w500.copyWith(color: AppColors.white)
                :AppStyle.black20w500,
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
                  border: Border.all(color: AppColors.primaryColor, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      languageProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyle.black20w500.copyWith(color: AppColors.primaryColor)),
                  const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primaryColor,
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
                :AppStyle.black20w500,
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
                  border: Border.all(color: AppColors.primaryColor, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      themeProvider.appTheme == ThemeMode.dark
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: AppStyle.black20w500.copyWith(color: AppColors.primaryColor)),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.primaryColor,
                    size: 35,
                  )
                ],
              ),
            ),
          ),

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
