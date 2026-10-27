import 'package:flutter/material.dart';

import '../../models/categorymodel/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category});
  CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Image.asset(category.imageURL,width: double.infinity,fit: BoxFit.fitWidth, );
  }
}