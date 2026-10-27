import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/articlemodel/article_model.dart';
import '../../models/categorymodel/category_model.dart';
import '../../models/sourcemodel/source_model.dart';
import '../articles/article_item.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourceViewModel;
  late ArticlesViewModel articlesViewModel;

  void fetchData() async {
    sourceViewModel = SourcesViewModel();
    articlesViewModel = ArticlesViewModel();
    await sourceViewModel.loadSources(widget.category);
    articlesViewModel.loadArticles(
      (sourceViewModel.state as SourcesSuccessState).sources[0],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourceViewModel),
        ChangeNotifierProvider.value(value: articlesViewModel),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, viewModel, _) {
              var state = viewModel.state;
              switch (state) {
                case SourcesInitialState():
                  {
                    return Container();
                  }
                case SourcesLoadingState():
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                case SourcesErrorState():
                  {
                    return Center(child: Text(state.message));
                  }
                case SourcesSuccessState():
                  {
                    return DefaultTabController(
                      length: state.sources.length,
                      child: TabBar(
                        onTap: (index) {
                          articlesViewModel.loadArticles(state.sources[index]);
                        },
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs: state.sources
                            .map((source) => Tab(text: source.name))
                            .toList(),
                      ),
                    );
                  }
              }
              // if (sourceViewModel.loading) {
              //   return Center(child: CircularProgressIndicator());
              // }
              // if (sourceViewModel.errorMessage.isNotEmpty) {
              //   return Center(child: Text(sourceViewModel.errorMessage));
              // }
            },
          ),
          Consumer<ArticlesViewModel>(
            builder: (context, viewModel, _) {
              var state = viewModel.state;

              switch (state) {
                case ArticlesInitialState():
                  {
                    return Container();
                  }

                case ArticlesLoadingState():
                  {
                    return Container(child: CircularProgressIndicator());
                  }
                case ArticlesErrorState():
                  {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    );
                  }
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
              //
              // if (viewModel.isLoading) {
              //   return Center(child: CircularProgressIndicator());
              // }
              // if (viewModel.errorMessage.isNotEmpty) {
              //   return Center(
              //     child: Text(
              //       viewModel.errorMessage,
              //       style: TextStyle(fontSize: 30, color: Colors.white),
              //     ),
              //   );
              // }
              // print("Success State");
            },
          ),
        ],
      ),
    );

    // return FutureBuilder(
    //     future: APIService.getSources(category),
    //     builder: (context, snapshot){
    //   if(snapshot.connectionState == ConnectionState.waiting){
    //     print("Loading Nwwww.....");
    //     return Center(child: CircularProgressIndicator(),);
    //   }
    //   if(snapshot.hasError){
    //     print("error Nwwww.....");
    //
    //     print(snapshot.error.toString());
    //     return Center(child: Text(snapshot.error.toString(), style: TextStyle(color: Colors.white, fontSize: 24),),);
    //   }
    //
    //   print("success stateeee");
    //
    //   List<Source> sources = snapshot.data?.sources ?? [];
    //     return Column(
    //     children: [

    //
    //     ],
    //   );
    //     });
  }
}