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
  AssetSvg get eyeSlash => const AssetSvg('assets/icons/eye-slash.svg');
  AssetSvg get eyeOff => const AssetSvg('assets/icons/eye-off.svg');
  AssetSvg get profile1 => const AssetSvg('assets/images/profile.svg');
  AssetSvg get profile => const AssetSvg('assets/icons/profile.png');
  AssetSvg get delete => const AssetSvg('assets/icons/delete.svg');
  AssetSvg get logoPng => const AssetSvg('assets/icons/logo.png');
  // Bottom nav icons
  AssetSvg get profileIcon => const AssetSvg(
        'assets/icons/profile-icon.svg',
      );
  AssetSvg get knowledgeIcon =>
      const AssetSvg('assets/icons/knowledge-icon.svg');
  AssetSvg get trackerIcon => const AssetSvg('assets/icons/tracker-icon.svg');
  AssetSvg get liveChatIcon => const AssetSvg('assets/icons/question-icon.svg');
  AssetSvg get communityIcon =>
      const AssetSvg('assets/icons/communities-icon.svg');
  // KnowledgePage icons
  AssetSvg get bookmarkIcon => const AssetSvg('assets/icons/bookmark-icon.svg');
  AssetSvg get bookmarkSelectedIcon =>
      const AssetSvg('assets/icons/bookmark-selected-icon.svg');
  AssetSvg get searchNormalIcon =>
      const AssetSvg('assets/icons/search-normal-icon.svg');
  AssetSvg get avatar => const AssetSvg('assets/icons/user.svg');
  AssetSvg get avatarPng => const AssetSvg('assets/icons/user.png');
  AssetSvg get floatingActionButtons =>
      const AssetSvg('assets/icons/floating_action_buttons.svg');
  AssetSvg get notif1 => const AssetSvg('assets/icons/notif1.svg');
  AssetSvg get notif2 => const AssetSvg('assets/icons/notif2.svg');
  AssetSvg get notif3 => const AssetSvg('assets/icons/notif3.svg');
  AssetSvg get dropDown => const AssetSvg('assets/icons/drop_down.svg');
  AssetSvg get dropUp => const AssetSvg('assets/icons/dropup.svg');
  AssetSvg get infoCircle => const AssetSvg('assets/icons/info-circle.svg');
  AssetSvg get close => const AssetSvg('assets/icons/close.svg');

  AssetSvg get rightArrow => const AssetSvg('assets/icons/right_arrow.svg');
  AssetSvg get editProfile => const AssetSvg('assets/icons/edit_profile.svg');
  AssetSvg get house => const AssetSvg('assets/icons/house.svg');
  AssetSvg get question => const AssetSvg('assets/icons/question.svg');
  AssetSvg get settings => const AssetSvg('assets/icons/settings.svg');
  AssetSvg get yourDetails => const AssetSvg('assets/icons/your_details.svg');
  AssetSvg get addReport => const AssetSvg('assets/icons/add_report.svg');
  AssetSvg get cover => const AssetSvg('assets/images/cover.jpg');

  AssetSvg get add => const AssetSvg('assets/icons/add.svg');
  AssetSvg get faq1 => const AssetSvg('assets/icons/faq.svg');
  AssetSvg get faq => const AssetSvg('assets/icons/faq.png');
  AssetSvg get message => const AssetSvg('assets/icons/message.svg');
  AssetSvg get messageNotify =>
      const AssetSvg('assets/icons/message_notify.svg');
  AssetSvg get more => const AssetSvg('assets/icons/more.svg');
  AssetSvg get sendMsgInactive =>
      const AssetSvg('assets/icons/send_msg_inactive.svg');
  AssetSvg get sendMsgActive =>
      const AssetSvg('assets/icons/send_msg_active.svg');
  // AssetSvg get chatBot => const AssetSvg('assets/icons/chatBot.svg');
  AssetSvg get chatBot => const AssetSvg('assets/icons/chatBot.png');

  // Tracker assets
  AssetSvg get messageQuestion =>
      const AssetSvg('assets/icons/tracker/message-question.svg');
  AssetSvg get compostBin =>
      const AssetSvg('assets/icons/tracker/compost-bin.png');
  AssetSvg get compostIcon =>
      const AssetSvg('assets/icons/tracker/compost-icon.png');
  AssetSvg get organicIcon =>
      const AssetSvg('assets/icons/tracker/organic-icon.png');
  AssetSvg get recycleIcon =>
      const AssetSvg('assets/icons/tracker/recycle-icon.png');
  AssetSvg get redBin => const AssetSvg('assets/icons/tracker/red-bin.png');
  AssetSvg get landfillIcon =>
      const AssetSvg('assets/icons/tracker/landfill-icon.png');
  AssetSvg get trashIcon2 =>
      const AssetSvg('assets/icons/tracker/trash-icon2.svg');
  AssetSvg get addBin => const AssetSvg('assets/icons/tracker/add-bin.svg');

  AssetSvg get generalNoteIcon =>
      const AssetSvg('assets/icons/tracker/general-note-icon.svg');
  AssetSvg get emptiedCompostIcon =>
      const AssetSvg('assets/icons/tracker/emptied-compost-icon.svg');
  AssetSvg get addWasteIcon =>
      const AssetSvg('assets/icons/tracker/add_waste_icon.svg');
  AssetSvg get calendarIcon =>
      const AssetSvg('assets/icons/tracker/calendar-icon.svg');



  //Community
  AssetSvg get create => const AssetSvg('assets/icons/community/create.svg');
  AssetSvg get photoClose => const AssetSvg('assets/icons/community/photo_close.svg');
  AssetSvg get searchNormal => const AssetSvg('assets/icons/community/search_normal.svg');
  AssetSvg get recycleBin => const AssetSvg('assets/icons/community/recycle-bin.png');
  AssetSvg get banner => const AssetSvg('assets/icons/community/community_banner.png');
  AssetSvg get closeCircle => const AssetSvg('assets/icons/community/close-circle.svg');
  AssetSvg get friendsAvatar => const AssetSvg('assets/icons/community/avatar.png');
  AssetSvg get notify => const AssetSvg('assets/icons/community/notify.svg');
  AssetSvg get community => const AssetSvg('assets/icons/community/community_icon.svg');
  AssetSvg get createCommunity => const AssetSvg('assets/icons/community/create_community.svg');
  AssetSvg get createCommunityPng => const AssetSvg('assets/icons/community/create_community.png');
  AssetSvg get streaks => const AssetSvg('assets/icons/community/streaks.svg');
  AssetSvg get tracking => const AssetSvg('assets/icons/community/tracking.svg');
  AssetSvg get communitiesBg => const AssetSvg('assets/icons/community/maze-communities-bg.png');
  AssetSvg get dislike => const AssetSvg('assets/icons/community/dislike.svg');
  AssetSvg get report => const AssetSvg('assets/icons/community/flag.svg');
  AssetSvg get noImage => const AssetSvg('assets/icons/community/no_image.svg');
  AssetSvg get medalStarIcon => const AssetSvg('assets/icons/community/medal-star.svg',);
  AssetSvg get backIcon => const AssetSvg('assets/icons/community/back.svg',);
  AssetSvg get searchIcon => const AssetSvg('assets/icons/community/search.svg',);
  AssetSvg get menuIcon => const AssetSvg('assets/icons/community/menu.svg',);
  AssetSvg get messageIcon => const AssetSvg('assets/icons/community/message2.svg',);
  AssetSvg get shareIcon => const AssetSvg('assets/icons/community/send-2.svg',);
  AssetSvg get share => const AssetSvg('assets/icons/community/share.svg');
  AssetSvg get heart => const AssetSvg('assets/icons/community/heart.svg');
  AssetSvg get mute => const AssetSvg('assets/icons/community/mute.svg');
  AssetSvg get dot => const AssetSvg('assets/icons/community/dot.svg');
  AssetSvg get trash => const AssetSvg('assets/icons/community/trash.svg');
  AssetSvg get lockCircle => const AssetSvg('assets/icons/community/lock-circle.svg');



  // community image
  AssetImage get placeHolderImage => const AssetImage('assets/images/placeholder-image.webp');
  AssetImage get personPlaceHolderImage => const AssetImage('assets/images/person-placeholder.png');


  AssetSvg  communityPostIcon({bool enabled = true}) =>
      AssetSvg(enabled ?
      'assets/icons/community/community-post-green.svg' :
      'assets/icons//community/community-post.svg');
  AssetSvg  leaderBoardIcon({bool enabled = true}) =>
      AssetSvg(enabled ?
      'assets/icons/community/leader-board-enabled.svg' :
      'assets/icons/community/leader-board.svg');
  AssetSvg  heartIcon({bool isLiked = false}) =>
      AssetSvg(isLiked ?
      'assets/icons/community/heart_liked.svg' :
      'assets/icons/community/heart.svg',);


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
