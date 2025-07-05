import 'dart:convert';
import 'dart:typed_data';
import 'package:projectr/shared/configs/app_configs.dart';
import 'package:projectr/shared/helpers/util.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/macs/hmac.dart' as hmac;
import 'package:pointycastle/pointycastle.dart' as pointycastle;
import 'package:pointycastle/key_derivators/pbkdf2.dart' as pbk;
import 'package:pointycastle/digests/sha1.dart' as sha1;

// ignore: depend_on_referenced_packages

abstract class IEncryptionHelper {
  String encryptData(String plainText);
  String decryptData(String encryptedData);
  String encryptPayload(dynamic plainText);
  String decryptPayload(dynamic encryptedData);
}

class EncryptionHelper implements IEncryptionHelper {
  static String password = AppConfigs.payload_enc_key;
  static String secretKey = AppConfigs.payload_enc_secret;
  // Method to encrypt data
  @override
  String encryptData(String plainText) {
    if (plainText == null || plainText.isEmpty) {
      return '';
    }

    final _key = encrypt.Key.fromUtf8(AppConfigs.encryptionKey);
    if (_key == null) {
      throw Exception('Encryption key is not initialized.');
    }
    final iv = encrypt.IV.fromLength(16); // Generate a random IV
    final encrypter =
        encrypt.Encrypter(encrypt.AES(_key, mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final ivBase64 = iv.base64;
    final encryptedBase64 = encrypted.base64;

    String val =
        '$ivBase64:$encryptedBase64'; // Store IV and ciphertext together
    return val;
  }

// Method to decrypt data
  @override
  String decryptData(String encryptedData) {
    if (encryptedData == null || encryptedData.isEmpty) {
      return '';
    }
    final _key = encrypt.Key.fromUtf8(AppConfigs.encryptionKey);
    if (_key == null) {
      throw Exception('Encryption key is not initialized.');
    }
    final parts = encryptedData.split(':');
    final iv = encrypt.IV.fromBase64(parts[0]); // Extract the IV
    final encrypted = encrypt.Encrypted.fromBase64(parts[1]);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(_key, mode: encrypt.AESMode.cbc));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  @override
  String encryptPayload(dynamic payload) {
    try {
      // Convert payload to JSON string
      final stringifiedPayload = json.encode(payload);

      // Generate PBKDF2 hash (equivalent to CryptoJS.PBKDF2)
      final pbkdf2 = pbk.PBKDF2KeyDerivator(hmac.HMac(sha1.SHA1Digest(), 64))
        ..init(pointycastle.Pbkdf2Parameters(
          _utf16leToUint8List(secretKey),
          1000,
          32,
        ));

      final hashBytes = pbkdf2.process(_utf16leToUint8List(password));
      final hash = _bytesToHex(hashBytes);

      // Extract key and IV
      final key = hash.substring(0, 64);
      final iv = hash.substring(0, 42);

      // Create Key and IV objects
      final keyBytes = _hexToBytes(key);
      final ivBytes = _hexToBytes(iv.substring(0, 32)); // Ensure IV is 16 bytes

      // Setup encryption
      final encrypter = encrypt.Encrypter(
        encrypt.AES(
          encrypt.Key(keyBytes),
          mode: encrypt.AESMode.cbc,
        ),
      );

      final ivParam = encrypt.IV(ivBytes);

      // Encrypt the payload (UTF-16LE encoded)
      final encrypted = encrypter.encryptBytes(
        _utf16leToUint8List(stringifiedPayload),
        iv: ivParam,
      );

      return encrypted.base64;
    } catch (e) {
      customDebugPrint(message: 'Error in encryptPayload: $e');
      return '';
    }
  }

  @override
  String decryptPayload(dynamic encryptedData) {
    try {
      // Generate PBKDF2 hash
      final pbkdf2 = pbk.PBKDF2KeyDerivator(hmac.HMac(sha1.SHA1Digest(), 64))
        ..init(pointycastle.Pbkdf2Parameters(
          _utf16leToUint8List(secretKey),
          1000,
          32,
        ));

      final hashBytes = pbkdf2.process(_utf16leToUint8List(password));
      final hash = _bytesToHex(hashBytes);

      // Extract key and IV
      final key = hash.substring(0, 64);
      final iv = hash.substring(0, 42);

      // Create Key and IV objects
      final keyBytes = _hexToBytes(key);
      final ivBytes = _hexToBytes(iv.substring(0, 32)); // Ensure IV is 16 bytes

      // Setup decryption
      final encrypter = encrypt.Encrypter(
        encrypt.AES(
          encrypt.Key(keyBytes),
          mode: encrypt.AESMode.cbc,
        ),
      );

      final ivParam = encrypt.IV(ivBytes);

      // Decrypt the data
      final decrypted = encrypter.decryptBytes(
        encrypt.Encrypted.fromBase64(encryptedData),
        iv: ivParam,
      );

      // Convert from UTF-16LE back to string
      final stringifiedDecrypted = _utf16leToString(decrypted);
      return json.decode(stringifiedDecrypted.trim());
    } catch (e) {
      customDebugPrint(message: 'Error in decryptPayload: $e');
      return '';
    }
  }

// Helper function to convert UTF-16LE string to Uint8List
  Uint8List _utf16leToUint8List(String input) {
    final encoded = String.fromCharCodes(input.runes).codeUnits;
    final bytes = Uint8List(encoded.length * 2);
    for (int i = 0; i < encoded.length; i++) {
      // Little Endian conversion
      bytes[i * 2] = encoded[i] & 0xff;
      bytes[i * 2 + 1] = (encoded[i] >> 8) & 0xff;
    }
    return bytes;
  }
}

// Helper function to convert Uint8List to UTF-16LE string
String _utf16leToString(List<int> input) {
  final bytes = _toUint8List(input);
  final codeUnits = List<int>.generate(bytes.length ~/ 2, (i) {
    return bytes[i * 2] | (bytes[i * 2 + 1] << 8);
  });
  return String.fromCharCodes(codeUnits);
}

Uint8List _toUint8List(List<int> input) {
  if (input is Uint8List) return input;
  return Uint8List.fromList(input);
}

// Helper function to convert bytes to hex string
String _bytesToHex(Uint8List bytes) {
  return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
}

// Helper function to convert hex string to bytes
Uint8List _hexToBytes(String hex) {
  final result = Uint8List(hex.length ~/ 2);
  for (var i = 0; i < hex.length; i += 2) {
    final byte = int.parse(hex.substring(i, i + 2), radix: 16);
    result[i ~/ 2] = byte;
  }
  return result;
}
