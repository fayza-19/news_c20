import 'package:news/api_service/source_responce/source.dart';


class SourcesResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;
  SourcesResponse({
    this.status,
    this.code,
    this.message,
    this.sources,});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }



}