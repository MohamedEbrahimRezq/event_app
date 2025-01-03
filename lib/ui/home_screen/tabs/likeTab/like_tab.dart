import 'package:flutter/material.dart';
import '../../../../app_utls/app_colors.dart';
import '../../../../app_utls/assets_manager.dart';
import '../../../reuseable_widgets/custom_text_form_feild.dart';
import '../homeTab/event_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LikeTab extends StatelessWidget {
  const LikeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
              child: CustomTextFormField(
                borderColor: AppColors.primaryColorLight,
                preIcon: Icons.search_outlined,
                hintText: AppLocalizations.of(context)!.search,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // EventWidget(
                    //   imageBg: AssetsManager.birthdayBg,
                    //   eventName: AppLocalizations.of(context)!.birthday,
                    // ),
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
