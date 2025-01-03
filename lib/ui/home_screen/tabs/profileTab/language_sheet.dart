import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage('en');
            },
            child: languageProvider.appLanguage == 'en' ?
            getSelectedItemWidget(AppLocalizations.of(context)!.english):
                getUnSlectedItemWidget(AppLocalizations.of(context)!.english)
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              languageProvider.changeAppLanguage('ar');
            },
            child: languageProvider.appLanguage == 'ar' ?
                getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
                getUnSlectedItemWidget(AppLocalizations.of(context)!.arabic)
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.blue),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: AppColors.blue,
        ),
      ],
    );
  }

  Widget getUnSlectedItemWidget(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.black),
    );
  }
}
