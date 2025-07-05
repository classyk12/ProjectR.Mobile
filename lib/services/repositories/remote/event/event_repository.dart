import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/event/event_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class EventRepository {
  ///get ASI index chart data
  Future<Either<AppException, List<EventModel>>> get();
}
