import 'package:envied/envied.dart';

part 'env.g.dart';

// ignore: avoid_classes_with_only_static_members
@Envied(path: '.env.dev')
abstract class DevEnv {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _DevEnv.baseUrl;

  @EnviedField(varName: 'SUPABASE_KEY', obfuscate: true)
  static final String supabase_key = _DevEnv.supabase_key;

  @EnviedField(varName: 'ENCRYPTION_KEY', obfuscate: true)
  static final String encryptKey = _DevEnv.encryptKey;
}
