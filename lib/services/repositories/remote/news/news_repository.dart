import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/news/news_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class NewsRepository {
  ///get user kyc status
  Future<Either<AppException, List<NewsModel>>> get();
}
