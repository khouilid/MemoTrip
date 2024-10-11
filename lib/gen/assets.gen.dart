/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/languages
  $AssetsIconsLanguagesGen get languages => const $AssetsIconsLanguagesGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/images/Calendar.svg');

  /// File path: assets/images/Location.svg
  SvgGenImage get location => const SvgGenImage('assets/images/Location.svg');

  /// File path: assets/images/Onboard-1.jpg
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/images/Onboard-1.jpg');

  /// File path: assets/images/favicon.png
  AssetGenImage get favicon => const AssetGenImage('assets/images/favicon.png');

  /// File path: assets/images/icon home.svg
  SvgGenImage get iconHome => const SvgGenImage('assets/images/icon home.svg');

  /// File path: assets/images/icon user.svg
  SvgGenImage get iconUser => const SvgGenImage('assets/images/icon user.svg');

  /// File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  /// File path: assets/images/onbaording_three.svg
  SvgGenImage get onbaordingThree =>
      const SvgGenImage('assets/images/onbaording_three.svg');

  /// File path: assets/images/onbaording_two.svg
  SvgGenImage get onbaordingTwo =>
      const SvgGenImage('assets/images/onbaording_two.svg');

  /// File path: assets/images/onboarding.mp4
  String get onboarding => 'assets/images/onboarding.mp4';

  /// File path: assets/images/onboarding_one.svg
  SvgGenImage get onboardingOne =>
      const SvgGenImage('assets/images/onboarding_one.svg');

  /// File path: assets/images/send icon.svg
  SvgGenImage get sendIcon => const SvgGenImage('assets/images/send icon.svg');

  /// List of all assets
  List<dynamic> get values => [
        calendar,
        location,
        onboard1,
        favicon,
        iconHome,
        iconUser,
        map,
        onbaordingThree,
        onbaordingTwo,
        onboarding,
        onboardingOne,
        sendIcon
      ];
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/map_styles.json
  String get mapStyles => 'assets/jsons/map_styles.json';

  /// List of all assets
  List<String> get values => [mapStyles];
}

class $AssetsIconsLanguagesGen {
  const $AssetsIconsLanguagesGen();

  /// File path: assets/icons/languages/apple.png
  AssetGenImage get apple =>
      const AssetGenImage('assets/icons/languages/apple.png');

  /// File path: assets/icons/languages/calendar.svg
  SvgGenImage get calendar =>
      const SvgGenImage('assets/icons/languages/calendar.svg');

  /// File path: assets/icons/languages/google.svg
  SvgGenImage get google =>
      const SvgGenImage('assets/icons/languages/google.svg');

  /// File path: assets/icons/languages/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/languages/home.svg');

  /// File path: assets/icons/languages/profile.svg
  SvgGenImage get profile =>
      const SvgGenImage('assets/icons/languages/profile.svg');

  /// File path: assets/icons/languages/search.svg
  SvgGenImage get search =>
      const SvgGenImage('assets/icons/languages/search.svg');

  /// File path: assets/icons/languages/timeline.svg
  SvgGenImage get timeline =>
      const SvgGenImage('assets/icons/languages/timeline.svg');

  /// List of all assets
  List<dynamic> get values =>
      [apple, calendar, google, home, profile, search, timeline];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
