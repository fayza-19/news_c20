import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../core/colorsmanager/colorsmanager.dart';
import '../../models/articlemodel/article_model.dart';
import '../articles/article_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  ArticlesViewModel viewModel = ArticlesViewModel();
  TextEditingController controller = TextEditingController();
  Timer? timer;
  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              style: TextStyle(color: ColorsManager.white),
              textInputAction: TextInputAction.search,
              onChanged: onSearchChanged,
              onSubmitted: (text) {
                timer?.cancel();
                if (text.trim().isNotEmpty) {
                  viewModel.searchArticles(text);
                }
              },
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    timer?.cancel();
                    controller.clear();
                  },
                  icon: Icon(Icons.close),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          Consumer<ArticlesViewModel>(
            builder: (context, vm, _) {
              var state = vm.state;
              switch (state) {
                case ArticlesInitialState():
                  return Container();
                case ArticlesLoadingState():
                  return Center(child: CircularProgressIndicator());
                case ArticlesErrorState():
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  );
                case ArticlesSuccessState():
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) =>
                          ArticleItem(article: state.articles[index]),
                      separatorBuilder: (_, index) => SizedBox(height: 12),
                      itemCount: state.articles.length,
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
  void onSearchChanged(String text) {
    timer?.cancel();
    if (text.trim().isEmpty) {
      return;
    }
    timer = Timer(Duration(milliseconds: 500), () {
      viewModel.searchArticles(text);
    });
  }
}