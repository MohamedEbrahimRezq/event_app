import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/app_utls/app_theme.dart';
import 'package:event_planning_app/provider/event_list_provider.dart';
import 'package:event_planning_app/provider/language_provider.dart';
import 'package:event_planning_app/provider/theme_provider.dart';
import 'package:event_planning_app/ui/home_screen/create_event_screen/create_event.dart';
import 'package:event_planning_app/ui/home_screen/edite_event_widget.dart';
import 'package:event_planning_app/ui/home_screen/event_details_widget.dart';
import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/login_screen/create_account.dart';
import 'package:event_planning_app/ui/login_screen/forget_password.dart';
import 'package:event_planning_app/ui/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ChangeNotifierProvider(create: (context) => EventListProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        CreateAccount.routeName: (context) => CreateAccount(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        CreateEvent.routeName: (context) => CreateEvent(),
        EventDetailsWidget.routeName: (context) => EventDetailsWidget(),
        EditeEventWidget.routeName: (context) => EditeEventWidget()
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
    );
  }
}
