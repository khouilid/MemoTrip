


import 'package:supabase_flutter/supabase_flutter.dart';


abstract class UserStorage {
  Future<User?> read();
  Future<void> save(User user);
  Future<void> clear();
}
