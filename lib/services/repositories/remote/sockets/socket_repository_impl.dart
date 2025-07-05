import 'package:projectr/services/api_services/sockets/socket_service.dart';
import 'package:projectr/services/repositories/remote/sockets/socket_repository.dart';

class SocketRepositoryImpl extends SocketRepository {
  final ISocketService service;

  SocketRepositoryImpl(this.service);

  @override
  void initialize() {
    service.initialize();
  }
}
