import 'package:flutter/cupertino.dart';
import 'package:news/features/main%20layout/mainlayout_screen.dart';

class RoutesManager{
  static const String mainLayout = '/mainLayout';
  static Map<String, WidgetBuilder> routes = {
    mainLayout: (_)=> MainLayout(),
  };
}