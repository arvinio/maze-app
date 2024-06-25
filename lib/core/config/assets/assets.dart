import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/di/injection_container.dart';

@LazySingleton()
class AssetsBase {
  static const String fontFamily = 'Urbanist';

  //AssetSvg get appIcon => const AssetSvg('assets/icons/app.png');
  AssetSvg get appIcon => const AssetSvg('assets/icons/app_icon.svg');
  AssetSvg get arrowLeft => const AssetSvg('assets/icons/arrow-left.svg');
  AssetSvg get eye => const AssetSvg('assets/icons/eye.svg');
  AssetSvg get eyeOff => const AssetSvg('assets/icons/eye-off.svg');
  AssetSvg get profile1 => const AssetSvg('assets/images/profile.svg');
  AssetSvg get profile => const AssetSvg('assets/icons/profile.png');

  AssetSvg get profileIcon => const AssetSvg('assets/icons/profile-icon.svg',  );
  AssetSvg get knowledgeIcon =>
      const AssetSvg('assets/icons/knowledge-icon.svg');
  AssetSvg get trackerIcon => const AssetSvg('assets/icons/tracker-icon.svg');
  AssetSvg get liveChatIcon => const AssetSvg('assets/icons/question-icon.svg');
  AssetSvg get communityIcon =>
      const AssetSvg('assets/icons/communities-icon.svg');
}

class AssetImage {
  const AssetImage(this._assetName);

  final String _assetName;

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

  String get path => _assetName;
}

class AssetSvg {
  //const AssetSvg(this._assetName, {this.assetNameDark});
  const AssetSvg(this._assetName);

  final String _assetName;
  //final String? assetNameDark;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
    bool? isDark,
  }) {
    return SvgPicture.asset(
      _assetName,
      // ((isDark ?? inject<ThemeService>().isDark) ? (assetNameDark ?? _assetName) : _assetName),
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}

AssetsBase appAssets = inject<AssetsBase>();
