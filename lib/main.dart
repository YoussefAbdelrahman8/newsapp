import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/Provider/SettingsProvider.dart';
import 'package:newsapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:newsapp/Screens/NewsScreen/NewsScreen.dart';
import 'package:newsapp/Screens/SplashScreen/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'AppStyle/AppStyle.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      debugShowCheckedModeBanner: false,
      locale: settingsProvider.locale,
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: ThemeMode.light,
      title: 'Flutter Template',
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewsScreen.routeName: (_) =>  NewsScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
