import 'package:flutter/material.dart';

import 'config/theme/them_manager.dart';
import 'core/routesmanager/routesmanager.dart';


void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.mainLayout,
      routes: RoutesManager.routes,
      theme:ThemeManager.light ,
      darkTheme: ThemeManager.dark,
      themeMode:ThemeMode.light,
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
    );
  }
}