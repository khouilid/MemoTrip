import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/presentation/app_widget.dart';
import 'core/presentation/managers/orientation_manager.dart';

void main() async {
  /// This function is used to ensure that the app is initialized before it is run.
  WidgetsFlutterBinding.ensureInitialized();

  registerErrorHandlers();

  /// This function is used to set the app orientation to portrait mode only.
  OrientationManager.setPortrait();

  /// This function is used to run the app.
   await SentryFlutter.init(
    (options) {
      options.dsn = 'https://60cdbf3f508874c543437c03997e9bb7@o4508104325988352.ingest.de.sentry.io/4508105608069200';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () =>   runApp(const ProviderScope(child: AppWidget())),
  );


}

void registerErrorHandlers() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Logger().log(Level.warning,
    //     "FlutterErrorDetails (RegisterErrorHandlers) |\n${details}");
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    // Logger().log(Level.error, "Main (RegisterErrorHandlers) |\n${stack}");

    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Text(details.toString()),
      ),
    );
  };
}
