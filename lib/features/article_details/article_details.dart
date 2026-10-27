import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../api_service/article_responce/article.dart';
import '../../core/colorsmanager/colorsmanager.dart';
import 'article_web_view.dart';

class ArticleDetailsSheet extends StatelessWidget {
  ArticleDetailsSheet({super.key, required this.article});
  Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.black,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorsManager.white, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(
            article.content ?? article.description ?? '',
            style: TextStyle(color: ColorsManager.white, fontSize: 14),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                NavigatorState navigator = Navigator.of(context);
                navigator.pop();
                navigator.push(
                  MaterialPageRoute(
                    builder: (_) => ArticleWebView(url: article.url ?? ''),
                  ),
                );
              },
              child: Text("View Full Article"),
            ),
          ),
        ],
      ),
    );
  }
}