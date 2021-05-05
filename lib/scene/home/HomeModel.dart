import 'package:flutter/material.dart';
import 'package:luobo_app/api/request/ArticlesRequest.dart';
import 'package:luobo_app/model/Article.dart';
import 'package:luobo_app/repository/ArticleRepository.dart';
import 'package:luobo_app/views/FeedArticleView.dart';

class HomeModel extends ChangeNotifier {
  // public
  List<FeedArticleViewModel> itemViewModels = List<FeedArticleViewModel>.empty();
  bool isLoading = false;

  // private
  ArticleRepositoryLogic _articleRepository;
  List<Article> _articles = List<Article>.empty();
  bool _hasNext = false;

  HomeModel(ArticleRepositoryLogic articleRepository) {
    this._articleRepository = articleRepository;
  }

  Future<void> reload() async {
    this.isLoading = true;

    final req = new ArticlesRequest();
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

  Future<void> next() async {
    this.isLoading = true;

    final req = new ArticlesRequest(nextID: this._articles.last.id);
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
