import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/presentation/app_widget.dart';
import 'core/presentation/managers/orientation_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://hkoimxejzioeczgqovnj.supabase.co',
      anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhrb2lteGVqemlvZWN6Z3Fvdm5qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg2ODA5NDUsImV4cCI6MjA0NDI1Njk0NX0.DM1lkS_GGrD8r4YKm0EaJ-84RukYcYOHCXQ7LF3sIIE');
  OrientationManager.setPortrait();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://60cdbf3f508874c543437c03997e9bb7@o4508104325988352.ingest.de.sentry.io/4508105608069200';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const ProviderScope(child: AppWidget())),
  );
}
