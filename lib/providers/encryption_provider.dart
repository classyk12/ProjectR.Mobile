//define data source

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/shared/helpers/encryption_helper.dart';

final enecryptionServiceProvider = Provider((ref) {
  final IEncryptionHelper encryptionService = EncryptionHelper();
  return encryptionService;
});
