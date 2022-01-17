import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  final storage = const FlutterSecureStorage();

// Unique key for token
  final keyToken = 'token';
  final keyExpiration = 'validade';

  save(String token, int expiration) async {
    await storage.write(key: keyToken, value: token);
    await storage.write(key: keyExpiration, value: expiration.toString());
  }

  Future<String?> get token async {
    try {
      String value = (await storage.read(key: keyToken))!;
      return 'Bearer $value';
    } catch (e) {
      return null;
    }
  }

  Future<DateTime> get expiration async {
    try {
      String? value = await storage.read(key: keyExpiration);
      return DateTime.fromMillisecondsSinceEpoch(int.parse(value!));
    } catch (e) {
      rethrow;
    }
  }
}
