// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter/material.dart' as _i6;
import 'package:template/app_update/domain/app_update_status_model.dart' as _i7;
import 'package:template/app_update/presentation/widget/app_update_dialog.dart'
    as _i1;
import 'package:template/Features/auth/presentation/splash_page.dart' as _i4;
import 'package:template/Features/Home/domain/memory_model.dart' as _i9;
import 'package:template/Features/Home/presentation/home_page.dart' as _i2;
import 'package:template/Features/Home/presentation/pages/image_viewer_screen.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AppUpdateRequiredRoute.name: (routeData) {
      final args = routeData.argsAs<AppUpdateRequiredRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppUpdateRequiredPage(
          key: args.key,
          appUpdateStatusModel: args.appUpdateStatusModel,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomePage(),
      );
    },
    ImageViewerRoute.name: (routeData) {
      final args = routeData.argsAs<ImageViewerRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ImageViewerPage(
          key: args.key,
          memoryModel: args.memoryModel,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppUpdateRequiredPage]
class AppUpdateRequiredRoute
    extends _i5.PageRouteInfo<AppUpdateRequiredRouteArgs> {
  AppUpdateRequiredRoute({
    _i6.Key? key,
    required _i7.AppUpdateStatusModel appUpdateStatusModel,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AppUpdateRequiredRoute.name,
          args: AppUpdateRequiredRouteArgs(
            key: key,
            appUpdateStatusModel: appUpdateStatusModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AppUpdateRequiredRoute';

  static const _i5.PageInfo<AppUpdateRequiredRouteArgs> page =
      _i5.PageInfo<AppUpdateRequiredRouteArgs>(name);
}

class AppUpdateRequiredRouteArgs {
  const AppUpdateRequiredRouteArgs({
    this.key,
    required this.appUpdateStatusModel,
  });

  final _i6.Key? key;

  final _i7.AppUpdateStatusModel appUpdateStatusModel;

  @override
  String toString() {
    return 'AppUpdateRequiredRouteArgs{key: $key, appUpdateStatusModel: $appUpdateStatusModel}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ImageViewerPage]
class ImageViewerRoute extends _i5.PageRouteInfo<ImageViewerRouteArgs> {
  ImageViewerRoute({
    _i8.Key? key,
    required _i9.MemoryModel memoryModel,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ImageViewerRoute.name,
          args: ImageViewerRouteArgs(
            key: key,
            memoryModel: memoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageViewerRoute';

  static const _i5.PageInfo<ImageViewerRouteArgs> page =
      _i5.PageInfo<ImageViewerRouteArgs>(name);
}

class ImageViewerRouteArgs {
  const ImageViewerRouteArgs({
    this.key,
    required this.memoryModel,
  });

  final _i8.Key? key;

  final _i9.MemoryModel memoryModel;

  @override
  String toString() {
    return 'ImageViewerRouteArgs{key: $key, memoryModel: $memoryModel}';
  }
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
