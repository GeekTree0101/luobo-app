
import 'package:luobo_app/api/NetworkingSupplier.dart';
import 'package:luobo_app/api/networking.dart';
import 'package:luobo_app/repository/ArticleRepository.dart';

class AppDependency {

  NetworkingLogic networking;
  ArticleRepositoryLogic articleRepository;

  AppDependency() {
    final networkingSupplier = NetworkingSupplier(true);
    this.networking = Networking(networkingSupplier);
    this.articleRepository = ArticleRepository(this.networking);
  }
}