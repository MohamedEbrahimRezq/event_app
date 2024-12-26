import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/language_provider.dart';
import '../../provider/theme_provider.dart';

class TabEventWidget extends StatelessWidget {
  String tabName;
  TabEventWidget({required this.tabName});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: height*.05,
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:AppColors.white,width: 2)

      ),
      child: Text(tabName,style: AppStyle.white14medium,),

         );
  }
}
