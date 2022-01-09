import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kurtlarvadisiimsakiye/core/mytheme.dart';
import 'package:kurtlarvadisiimsakiye/views/homescreen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('tr')
        ],
        theme: myTheme,
        locale: const Locale('tr'),
        debugShowCheckedModeBanner: false,
        title: 'Kurtlar Vadisi İmsakiye',
        home: const HomeScreen());
  }
}
