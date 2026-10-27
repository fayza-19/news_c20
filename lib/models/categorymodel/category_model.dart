
import '../../core/assetsmanager/assetsmanager.dart';

class CategoryModel{
  String id;
  String name;
  String imageURL;
  CategoryModel({required this.id, required this.name, required this.imageURL});
  static List<CategoryModel> categories = [
    CategoryModel(id: "general", name: "General", imageURL: ImageAssets.general),
    CategoryModel(id: "business", name: "Business", imageURL: ImageAssets.business),
    CategoryModel(id: "sports", name: "Sports", imageURL: ImageAssets.sports),
    CategoryModel(id: "technology", name: "Technology", imageURL: ImageAssets.tech),
    CategoryModel(id: "entertainment", name: "Entertainment", imageURL: ImageAssets.entertainment),
    CategoryModel(id: "health", name: "Health", imageURL: ImageAssets.health),
    CategoryModel(id: "science", name: "Science", imageURL: ImageAssets.science),
  ];
}


