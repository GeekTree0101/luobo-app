
import 'package:luobo_app/api/Networking.dart';
import 'package:luobo_app/api/NetworkingSupplier.dart';
import 'package:luobo_app/repository/ArticleRepository.dart';
import 'package:luobo_app/repository/CategoryRepository.dart';

class AppDependency {

  NetworkingLogic networking;
  ArticleRepositoryLogic articleRepository;
  CategoryRepositoryLogic categoryRepository;

  AppDependency() {
    final networkingSupplier = NetworkingSupplier(true);
    this.networking = Networking(networkingSupplier);
    this.articleRepository = ArticleRepository(this.networking);
    this.categoryRepository = CategoryRepository(this.networking);
  }
}