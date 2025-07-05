import 'package:projectr/services/api_services/watchlist/watchlist_service.dart';
import 'package:projectr/services/repositories/remote/watchlist/watchlist_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/watchlist/create_watchlist_model.dart';
import 'package:projectr/shared/domain/models/watchlist/watchlist_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class WatchlistRepositoryImpl extends WatchlistRepository {
  final IWatchlistService service;

  WatchlistRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<WatchlistModel>>> getWatchlist() async {
    return await service.getWatchlist();
  }

  @override
  Future<Either<AppException, bool>> createWatchlist(
      {required CreateWatchlistModel model}) async {
    return await service.createWatchlist(model: model);
  }

  @override
  Future<Either<AppException, bool>> deleteWatchlist({required num? id}) async {
    return await service.deleteWatchlist(id: id);
  }
}
