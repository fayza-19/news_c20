import 'package:flutter/material.dart';

import '../../api_service/api_services.dart';
import '../../api_service/article_responce/article.dart';
import '../../api_service/article_responce/article_resp.dart';
import '../../api_service/source_responce/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesState state = ArticlesInitialState();

  void loadArticles(Source source) async {
    state = ArticlesLoadingState();
    notifyListeners();
    ArticlesResponse articlesResponse = await APIService.getArticles(source);
    if(articlesResponse.status == 'error'){

      state = ArticlesErrorState(message: articlesResponse.message ?? '');
    }else{

      state = ArticlesSuccessState(articles: articlesResponse.articles ?? []);
    }
    notifyListeners();
  }

  void searchArticles(String query) async {
    state = ArticlesLoadingState();
    notifyListeners();
    ArticlesResponse articlesResponse = await APIService.searchArticles(query);
    if (articlesResponse.status == 'error') {
      state = ArticlesErrorState(message: articlesResponse.message ?? '');
    } else {
      state = ArticlesSuccessState(articles: articlesResponse.articles ?? []);
    }
    notifyListeners();
  }
}


sealed class ArticlesState{}
class ArticlesInitialState extends ArticlesState{}
class ArticlesLoadingState extends ArticlesState{
  String? message;
  ArticlesLoadingState({this.message});
}
class ArticlesErrorState extends ArticlesState{
  String message;
  ArticlesErrorState({required this.message});
}
class ArticlesSuccessState extends ArticlesState{
  List<Article> articles;
  ArticlesSuccessState({required this.articles});
}
