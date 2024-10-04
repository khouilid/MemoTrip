import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'core/presentation/app_widget.dart';
import 'core/presentation/managers/orientation_manager.dart';

void main() async {
  /// This function is used to ensure that the app is initialized before it is run.
  WidgetsFlutterBinding.ensureInitialized();


  registerErrorHandlers();

  /// This function is used to set the app orientation to portrait mode only.
  OrientationManager.setPortrait();

  /// This function is used to run the app.
  runApp(const ProviderScope(child: AppWidget()));
}


void registerErrorHandlers() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    Logger().log(Level.warning,
        "FlutterErrorDetails (RegisterErrorHandlers) |\n${details}");
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    Logger().log(Level.error, "Main (RegisterErrorHandlers) |\n${stack}");

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
