import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteServerConnexion {
  SupabaseClient instance() {
    return Supabase.instance.client;
  }
}
