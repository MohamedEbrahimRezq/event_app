import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../app_utls/app_colors.dart';
import '../../../../provider/theme_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeAppTheme(ThemeMode.light);
              },
              child: themeProvider.appTheme == ThemeMode.light
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnSlectedItemWidget(
                      AppLocalizations.of(context)!.light)),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
              onTap: () {
                themeProvider.changeAppTheme(ThemeMode.dark);
              },
              child: themeProvider.appTheme == ThemeMode.dark
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  : getUnSlectedItemWidget(
                  AppLocalizations.of(context)!.dark)),
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
