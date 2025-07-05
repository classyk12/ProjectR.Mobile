import 'package:projectr/services/api_services/events/event_service.dart';
import 'package:projectr/services/repositories/remote/event/event_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/event/event_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class EventRepositoryImpl extends EventRepository {
  final IEventService service;

  EventRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<EventModel>>> get() async {
    return await service.getEvents();
  }
}
