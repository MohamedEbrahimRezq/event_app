import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:event_planning_app/provider/language_provider.dart';
import 'package:event_planning_app/tabs/homeTab/home_tab.dart';
import 'package:event_planning_app/tabs/likeTab/like_tab.dart';
import 'package:event_planning_app/tabs/mapTab/map_tab.dart';
import 'package:event_planning_app/tabs/profileTab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabList = [ HomeTab(),  MapTab(),  LikeTab(),  ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(

      extendBodyBehindAppBar: true,
          body: tabList[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
          onPressed: (){},
        child: Icon(Icons.add,color: AppColors.white,size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.transparent,
        ),
        child: BottomAppBar(

          color: Theme.of(context).primaryColor,
          notchMargin: 4,
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            type:BottomNavigationBarType.fixed ,
            unselectedItemColor: AppColors.white,
            selectedItemColor: AppColors.white,
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,

              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
              setState(() {

              });
                },
              items: [
                builtBottomNavBarItem(
                    index: 0,
                    iconName: AssetsManager.iconHome,
                    selectedIconName: AssetsManager.iconHomeSelected,
                    label: AppLocalizations.of(context)!.homeTab),
                builtBottomNavBarItem(
                    index: 1,
                    iconName: AssetsManager.iconMap,
                    selectedIconName: AssetsManager.iconMapSelected,
                    label: AppLocalizations.of(context)!.mapTab),
                builtBottomNavBarItem(
                    index: 2,
                    iconName: AssetsManager.iconLike,
                    selectedIconName: AssetsManager.iconLikeSelected,
                    label: AppLocalizations.of(context)!.likeTab),
                builtBottomNavBarItem(
                    index: 3,
                    iconName: AssetsManager.iconProfile,
                    selectedIconName: AssetsManager.iconProfileSelected,
                    label: AppLocalizations.of(context)!.profileTab),
              ]),
        ),
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavBarItem(
      {required int index,
      required String iconName,
      required String selectedIconName,
      required String label}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage(selectedIndex == index ? selectedIconName : iconName)),
        label: label);
  }


}
