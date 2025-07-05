import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/response.dart';

class AppException implements Exception {
  final dynamic message;
  final dynamic error;

  AppException({
    required this.message,
    required this.error,
  });
}

// class CacheFailureException extends Equatable implements AppException {
//   @override
//   String get identifier => 'Cache failure exception';

//   @override
//   String get message => 'Unable to save user';

//   @override
//   int get statusCode => 100;

//   @override
//   List<Object?> get props => [message, statusCode, identifier];

//   @override
//   String get error => 'Error!';

//   @override
//   int get status => 400;
// }

//  extension

extension HttpExceptionExtension on AppException {
  Left<AppException, BaseResponse> get toLeft =>
      Left<AppException, BaseResponse>(this);
}
