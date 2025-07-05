import 'package:projectr/services/api_services/news/news_service.dart';
import 'package:projectr/services/repositories/remote/news/news_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/news/news_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class NewsRepositoryImpl extends NewsRepository {
  final INewsService service;

  NewsRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<NewsModel>>> get() async {
    return await service.get();
  }
}
