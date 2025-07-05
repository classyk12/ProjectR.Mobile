import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/domain/models/watchlist/create_watchlist_model.dart';
import 'package:projectr/shared/domain/models/watchlist/watchlist_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class IWatchlistService {
  ///get user watchlist
  Future<Either<AppException, List<WatchlistModel>>> getWatchlist();

  ///create user watchlist
  Future<Either<AppException, bool>> createWatchlist(
      {required CreateWatchlistModel model});

  ///delete user watchlist
  Future<Either<AppException, bool>> deleteWatchlist({required num? id});
}

class WatchlistService implements IWatchlistService {
  final NetworkService networkService;

  WatchlistService(this.networkService);

  @override
  Future<Either<AppException, List<WatchlistModel>>> getWatchlist() async {
    try {
      final eitherType = await networkService.get(
        'watchlist',
      );

      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting equities.',
            ),
          );
        },
        (response) {
          final watchlist = List<WatchlistModel>.from(
              response.data['data'].map((x) => WatchlistModel.fromMap(x)));
          return Right(watchlist);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting equities.',
          error: 'Error!',
        ),
      );
    }
  }

  // https://core2-staging.cardinalstone.com/watchlist/12

  @override
  Future<Either<AppException, bool>> createWatchlist(
      {required CreateWatchlistModel model}) async {
    try {
      var json = model.toMap();
      final eitherType = await networkService.post(
        'watchlist',
        data: json,
      );

      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while adding watchlist.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while adding watchlist.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> deleteWatchlist({required num? id}) async {
    try {
      final eitherType = await networkService.delete(
        'watchlist/$id',
      );

      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while deleting watchlist.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while deleting watchlist.',
          error: 'Error!',
        ),
      );
    }
  }
}
