import 'package:app_components/src/pages/alert_page.dart';
import 'package:app_components/src/pages/avatar_page.dart';
import 'package:app_components/src/pages/home_page.dart';
import 'package:app_components/src/pages/home_temp.dart';
import 'package:app_components/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // spanish
       // const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes() ,
//      onGenerateRoute: (RouteSettings settings){
//        print("Ruta llamada: ${settings.name}");
//        return MaterialPageRoute(
//            builder: (BuildContext context) => AvatarPage()
//        );
//      },
    );
  }
}
