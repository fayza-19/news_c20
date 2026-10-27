import 'package:flutter/material.dart';


import '../../core/colorsmanager/colorsmanager.dart';
import '../../models/categorymodel/category_model.dart';
import '../category/category_view.dart';
import '../drawer/custome_drawer.dart';
import '../search/search_view.dart';
import '../source/source_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late Widget selectedWidget;

  late String title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesView(
      onCategoryItemClicked: onCategoryItemClicked,
    );
    title = "Home";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
          onPressed: () {
    selectedWidget = SearchView();
    title = "Search";
    setState(() {});
    },
      icon: Icon(Icons.search, color: ColorsManager.white),
    ),
        ],
      ),
      drawer: CustomDrawer(onGoToHomeClicked: onGoToHomeClicked),

      body: selectedWidget,
    );
  }

  void onGoToHomeClicked() {
    selectedWidget = CategoriesView(
      onCategoryItemClicked: onCategoryItemClicked,
    );
    title = "Home";
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryItemClicked(CategoryModel category) {
    selectedWidget = SourcesView(category: category,);
    title = category.name;
    setState(() {});
  }
}