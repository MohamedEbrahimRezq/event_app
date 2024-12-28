import 'package:event_planning_app/home_screen/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_utls/app_colors.dart';
import '../../app_utls/assets_manager.dart';
import '../../provider/language_provider.dart';
import '../../provider/theme_provider.dart';
import '../homeTab/event_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LikeTab extends StatelessWidget {
  const LikeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .07,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomTextFormFeild(
                borderColor: AppColors.primaryColorLight,
                preIcon: Icons.search_outlined,
                hintText: AppLocalizations.of(context)!.search,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EventWidget(
                      imageBg: AssetsManager.birthdayBg,
                      eventName: AppLocalizations.of(context)!.birthday,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.sportBg,
                      eventName: AppLocalizations.of(context)!.sport,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.meetingBg,
                      eventName: AppLocalizations.of(context)!.meeting,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.gamingBg,
                      eventName: AppLocalizations.of(context)!.gaming,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.eatingBg,
                      eventName: AppLocalizations.of(context)!.eating,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.holidayBg,
                      eventName: AppLocalizations.of(context)!.holiday,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.exhibitionBg,
                      eventName: AppLocalizations.of(context)!.exhibition,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.bookclubBg,
                      eventName: AppLocalizations.of(context)!.book_club,
                    ),
                    EventWidget(
                      imageBg: AssetsManager.workshopBg,
                      eventName: AppLocalizations.of(context)!.work_shop,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
