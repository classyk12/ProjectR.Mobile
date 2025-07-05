import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/services/api_services/sockets/socket_service.dart';
import 'package:projectr/services/repositories/remote/sockets/socket_repository_impl.dart';

///socket service provider
final socketServiceProvider = Provider<ISocketService>(
  (_) => SocketService(),
);

///socket repository provider
final socketRepositoryProvider = Provider<SocketRepositoryImpl>(
  (ref) {
    final ISocketService service = ref.watch(socketServiceProvider);
    service.initialize();

    // Clean up when the provider is no longer used
    ref.onDispose(() {
      service.dispose();
    });

    return SocketRepositoryImpl(service);
  },
);
