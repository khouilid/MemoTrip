// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:auto_route/auto_route.dart' as _i8;
// import 'package:flutter/material.dart' as _i9;
// import 'package:template/app_update/domain/app_update_status_model.dart'
//     as _i10;
// import 'package:template/app_update/presentation/widget/app_update_dialog.dart'
//     as _i1;
// import 'package:template/Features/auth/presentation/sign_in_page.dart' as _i5;
// import 'package:template/Features/Home/presentation/home_page.dart' as _i2;
// import 'package:template/Features/Home/presentation/pages/image_viewer_screen.dart'
//     as _i3;
// import 'package:template/Features/notifications/presentation/notifications_page.dart'
//     as _i4;
// import 'package:template/Features/splash/splash_page.dart' as _i6;
// import 'package:template/Features/user/presentation/user_page.dart' as _i7;

// abstract class $AppRouter extends _i8.RootStackRouter {
//   $AppRouter({super.navigatorKey});

//   @override
//   final Map<String, _i8.PageFactory> pagesMap = {
//     AppUpdateRequiredRoute.name: (routeData) {
//       final args = routeData.argsAs<AppUpdateRequiredRouteArgs>();
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i1.AppUpdateRequiredPage(
//           key: args.key,
//           appUpdateStatusModel: args.appUpdateStatusModel,
//         ),
//       );
//     },
//     HomeRoute.name: (routeData) {
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i2.HomePage(),
//       );
//     },
//     ImageViewerRoute.name: (routeData) {
//       final args = routeData.argsAs<ImageViewerRouteArgs>();
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: _i3.ImageViewerPage(
//           key: args.key,
//           galleryItems: args.galleryItems,
//         ),
//       );
//     },
//     NotificationsRoute.name: (routeData) {
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i4.NotificationsPage(),
//       );
//     },
//     SignInRoute.name: (routeData) {
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i5.SignInPage(),
//       );
//     },
//     SplashRoute.name: (routeData) {
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i6.SplashPage(),
//       );
//     },
//     UserRoute.name: (routeData) {
//       return _i8.AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const _i7.UserPage(),
//       );
//     },
//   };
// }

// /// generated route for
// /// [_i1.AppUpdateRequiredPage]
// class AppUpdateRequiredRoute
//     extends _i8.PageRouteInfo<AppUpdateRequiredRouteArgs> {
//   AppUpdateRequiredRoute({
//     _i9.Key? key,
//     required _i10.AppUpdateStatusModel appUpdateStatusModel,
//     List<_i8.PageRouteInfo>? children,
//   }) : super(
//           AppUpdateRequiredRoute.name,
//           args: AppUpdateRequiredRouteArgs(
//             key: key,
//             appUpdateStatusModel: appUpdateStatusModel,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'AppUpdateRequiredRoute';

//   static const _i8.PageInfo<AppUpdateRequiredRouteArgs> page =
//       _i8.PageInfo<AppUpdateRequiredRouteArgs>(name);
// }

// class AppUpdateRequiredRouteArgs {
//   const AppUpdateRequiredRouteArgs({
//     this.key,
//     required this.appUpdateStatusModel,
//   });

//   final _i9.Key? key;

//   final _i10.AppUpdateStatusModel appUpdateStatusModel;

//   @override
//   String toString() {
//     return 'AppUpdateRequiredRouteArgs{key: $key, appUpdateStatusModel: $appUpdateStatusModel}';
//   }
// }

// /// generated route for
// /// [_i2.HomePage]
// class HomeRoute extends _i8.PageRouteInfo<void> {
//   const HomeRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           HomeRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HomeRoute';

//   static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
// }

// /// generated route for
// /// [_i3.ImageViewerPage]
// class ImageViewerRoute extends _i8.PageRouteInfo<ImageViewerRouteArgs> {
//   ImageViewerRoute({
//     _i9.Key? key,
//     required List<String> galleryItems,
//     List<_i8.PageRouteInfo>? children,
//   }) : super(
//           ImageViewerRoute.name,
//           args: ImageViewerRouteArgs(
//             key: key,
//             galleryItems: galleryItems,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'ImageViewerRoute';

//   static const _i8.PageInfo<ImageViewerRouteArgs> page =
//       _i8.PageInfo<ImageViewerRouteArgs>(name);
// }

// class ImageViewerRouteArgs {
//   const ImageViewerRouteArgs({
//     this.key,
//     required this.galleryItems,
//   });

//   final _i9.Key? key;

//   final List<String> galleryItems;

//   @override
//   String toString() {
//     return 'ImageViewerRouteArgs{key: $key, galleryItems: $galleryItems}';
//   }
// }

// /// generated route for
// /// [_i4.NotificationsPage]
// class NotificationsRoute extends _i8.PageRouteInfo<void> {
//   const NotificationsRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           NotificationsRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'NotificationsRoute';

//   static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
// }

// /// generated route for
// /// [_i5.SignInPage]
// class SignInRoute extends _i8.PageRouteInfo<void> {
//   const SignInRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           SignInRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'SignInRoute';

//   static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
// }

// /// generated route for
// /// [_i6.SplashPage]
// class SplashRoute extends _i8.PageRouteInfo<void> {
//   const SplashRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           SplashRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'SplashRoute';

//   static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
// }

// /// generated route for
// /// [_i7.UserPage]
// class UserRoute extends _i8.PageRouteInfo<void> {
//   const UserRoute({List<_i8.PageRouteInfo>? children})
//       : super(
//           UserRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'UserRoute';

//   static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
// }
