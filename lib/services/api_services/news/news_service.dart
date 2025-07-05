import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/news/news_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class INewsService {
  Future<Either<AppException, List<NewsModel>>> get();
}

class NewsService implements INewsService {
  final NetworkService networkService;

  NewsService(this.networkService);

  @override
  Future<Either<AppException, List<NewsModel>>> get() async {
    try {
      final eitherType = await networkService.get(
        'market-news',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting news.',
            ),
          );
        },
        (response) {
          final data = List<NewsModel>.from(
              response.data['data'].map((x) => NewsModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting news.',
          error: 'Error!',
        ),
      );
    }
  }
}
