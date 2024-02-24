import 'dart:convert';

import 'package:crypto/crypto.dart';

/// [CoolStringExtensions] contains helpful extensions for string operation
extension CoolStringExtensions on String {
  /// [stringToSha256] converts Raw String to Sha256
  String get stringToSha256 {
    final bytes = utf8.encode(this);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
