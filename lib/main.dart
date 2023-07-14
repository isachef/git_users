import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tt_c/screens/user_list_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    var localeResolutionCallback =
        (Locale? locale, Iterable<Locale> supportedLocales) {
      if (locale != null) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
      }
      return supportedLocales.first; // Язык по умолчанию
    };

    return MaterialApp(
      title: 'Multilingual App',
      theme: ThemeData(primarySwatch: Colors.blue),
debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // Английский (США)
        const Locale('ru', 'RU'), // Русский (Россия)
      ],
      localeResolutionCallback: localeResolutionCallback,
      home: UserListSreen(),
    );
  }
}
