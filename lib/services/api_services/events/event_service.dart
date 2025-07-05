import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/event/event_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/helper.dart';

abstract class IEventService {
  Future<Either<AppException, List<EventModel>>> getEvents();
}

class EventService implements IEventService {
  final NetworkService networkService;

  EventService(this.networkService);

  @override
  Future<Either<AppException, List<EventModel>>> getEvents() async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'event/external',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting events.',
            ),
          );
        },
        (response) {
          final events = List<EventModel>.from(
              response.data['data'].map((x) => EventModel.fromMap(x)));
          return Right(events);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting events.',
          error: 'Error!',
        ),
      );
    }
  }
}
