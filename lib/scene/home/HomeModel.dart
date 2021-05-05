import 'package:flutter/material.dart';
import 'package:luobo_app/api/request/ArticlesRequest.dart';
import 'package:luobo_app/model/Article.dart';
import 'package:luobo_app/repository/ArticleRepository.dart';
import 'package:luobo_app/views/FeedArticleView.dart';

class HomeModel extends ChangeNotifier {
  // public
  List<FeedArticleViewModel> itemViewModels;
  bool isLoading;

  // private
  ArticleRepositoryLogic _articleRepository;
  List<Article> _articles;
  bool _hasNext;

  HomeModel(ArticleRepositoryLogic articleRepository) {
    this._articleRepository = articleRepository;
  }

  void reload() async {
    this.isLoading = true;

    final req = ArticlesRequest();
    final res = await this._articleRepository.getArticles(req);

    this._articles = res.articles;
    this.itemViewModels = res.articles.map((article) => FeedArticleViewModel(
          title: article.title,
          description: article.createdAt.toString(),
          price: article.price,
        ));
    this._hasNext = res.articles.isNotEmpty;

    this.isLoading = false;
    notifyListeners();
  }

  void next() async {
    
    this.isLoading = true;

    final req = ArticlesRequest(nextID: this._articles.last.id);
    final res = await this._articleRepository.getArticles(req);

    this._articles += res.articles;
    this.itemViewModels += res.articles.map((article) => FeedArticleViewModel(
          title: article.title,
          description: article.createdAt.toString(),
          price: article.price,
        ));
    this._hasNext = res.articles.isNotEmpty;

    this.isLoading = false;
    notifyListeners();
  }

  bool shouldBatch() {
    return this.isLoading == false && this._hasNext == true;
  }
}
