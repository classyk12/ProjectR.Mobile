import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/watchlist/create_watchlist_model.dart';
import 'package:projectr/shared/domain/models/watchlist/watchlist_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class WatchlistRepository {
  ///get user watchlist
  Future<Either<AppException, List<WatchlistModel>>> getWatchlist();

  ///get create watchlist
  Future<Either<AppException, bool>> createWatchlist(
      {required CreateWatchlistModel model});

  ///delete user watchlist
  Future<Either<AppException, bool>> deleteWatchlist({required num? id});
}
