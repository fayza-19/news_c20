import 'package:flutter/material.dart';

import '../../api_service/api_services.dart';
import '../../api_service/source_responce/source.dart';
import '../../api_service/source_responce/source_resp.dart';
import '../categorymodel/category_model.dart';


class SourcesViewModel extends ChangeNotifier {


  SourcesState state  =  SourcesInitialState();

  Future<void> loadSources(CategoryModel category) async {
    state = SourcesLoadingState();
    notifyListeners();
    SourcesResponse sourcesResponse = await APIService.getSources(category);

    if(sourcesResponse.status == 'error'){
      state = SourcesErrorState(message: sourcesResponse.message ?? '');
    }else{

      state = SourcesSuccessState(sources: sourcesResponse.sources ?? []);
    }
    notifyListeners();
  }


}

sealed class SourcesState{}

class SourcesInitialState extends SourcesState{}
class SourcesSuccessState extends SourcesState{
  List<Source> sources;
  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesState{
  String? message;
  SourcesLoadingState({this.message});
}

class SourcesErrorState extends SourcesState{
  String message;
  SourcesErrorState({required this.message});
}




