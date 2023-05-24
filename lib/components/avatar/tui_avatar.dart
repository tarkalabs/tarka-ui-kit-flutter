import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tui_colors.dart';
import 'package:tarka_ui/styles/tui_text_style.dart';

/// TUIAvatar is used to create a Avatar with content, size and badge flag.
class TUIAvatar extends StatelessWidget {
  final TUIAvatarSize avatarSize;
  final TUIAvatarContent avatarContent;
  final bool isBadged;

  const TUIAvatar({
    super.key,
    required this.avatarSize,
    required this.avatarContent,
    this.isBadged = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget circleChild;

    if (avatarContent.icon != null) {
      circleChild = Icon(
        avatarContent.icon!.icon,
        size: avatarSize._getAvatarSize() / 2,
        color: TUIColors.constantLight,
      );
    } else if (avatarContent.text != null) {
      TextStyle textStyle = avatarSize._getTextStyle().copyWith(
            color: TUIColors.onTertiary,
          );

      circleChild = Text(
        avatarContent.text!,
        style: textStyle,
      );
    } else {
      circleChild = ClipOval(child: avatarContent.image!);
    }

    CircleAvatar circleAvatar = CircleAvatar(
      radius: avatarSize._getAvatarSize() / 2,
      backgroundColor: TUIColors.tertiary,
      child: circleChild,
    );

    if (isBadged) {
      return LayoutBuilder(
        builder: (context, constraints) {
          Positioned badge;

          if (constraints.maxHeight != double.infinity) {
            badge = Positioned(
              left: constraints.maxWidth / 2 + avatarSize._getAvatarSize() / 4,
              top: constraints.maxHeight / 2 + avatarSize._getAvatarSize() / 4,
              child: Container(
                height: avatarSize._getBadgeSize(),
                width: avatarSize._getBadgeSize(),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TUIColors.success,
                ),
              ),
            );
          } else {
            badge = Positioned(
              left: constraints.maxWidth / 2 + avatarSize._getAvatarSize() / 4,
              bottom: 0,
              child: Container(
                height: avatarSize._getBadgeSize(),
                width: avatarSize._getBadgeSize(),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TUIColors.success,
                ),
              ),
            );
          }

          return Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: avatarSize._getAvatarSize(),
                  height: avatarSize._getAvatarSize(),
                  child: circleAvatar,
                ),
              ),
              badge
            ],
          );
        },
      );
    } else {
      return circleAvatar;
    }
  }
}

/// TUIAvatarContent stores the content type and the content for the Avatar.
class TUIAvatarContent {
  final TUIAvatarContentType type;
  final Icon? icon;
  final TUIImage? image;
  final String? text;

  TUIAvatarContent({required this.type, this.icon, this.image, this.text});
}

/// TUIAvatarContentType is used to define the content type of Avatar.
enum TUIAvatarContentType { image, icon, text }

/// TUIAvatarSize is used to define the size of Avatar.
enum TUIAvatarSize {
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl;

  double _getAvatarSize() {
    switch (this) {
      case TUIAvatarSize.xxs:
        return 24;
      case TUIAvatarSize.xs:
        return 32;
      case TUIAvatarSize.s:
        return 40;
      case TUIAvatarSize.m:
        return 48;
      case TUIAvatarSize.l:
        return 64;
      case TUIAvatarSize.xl:
        return 80;
      case TUIAvatarSize.xxl:
        return 96;
    }
  }

  double _getBadgeSize() {
    switch (this) {
      case TUIAvatarSize.xxs:
      case TUIAvatarSize.xs:
      case TUIAvatarSize.s:
      case TUIAvatarSize.m:
        return 12;
      case TUIAvatarSize.l:
        return 16;
      case TUIAvatarSize.xl:
      case TUIAvatarSize.xxl:
        return 24;
    }
  }

  TextStyle _getTextStyle() {
    switch (this) {
      case TUIAvatarSize.xxs:
        return TUITextStyle.body8;
      case TUIAvatarSize.xs:
        return TUITextStyle.heading7;
      case TUIAvatarSize.s:
        return TUITextStyle.heading6;
      case TUIAvatarSize.m:
        return TUITextStyle.heading5;
      case TUIAvatarSize.l:
        return TUITextStyle.heading4;
      case TUIAvatarSize.xl:
        return TUITextStyle.heading3;
      case TUIAvatarSize.xxl:
        return TUITextStyle.heading2;
    }
  }
}

/// TUIImage is used as an abstraction to handle asset and network image.
class TUIImage extends StatelessWidget {
  final String? _imageUrl;
  final String? _assetPath;

  const TUIImage({
    super.key,
    String? imageUrl,
    String? assetPath,
  })  : _assetPath = assetPath,
        _imageUrl = imageUrl,
        assert(
          imageUrl != null || assetPath != null,
          'imageUrl or assetPath must be provided.',
        );

  @override
  Image build(BuildContext context) {
    if (_assetPath != null) {
      return Image.asset(
        _assetPath!,
      );
    } else {
      return Image.network(
        _imageUrl!,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Text('Failed to load image');
        },
      );
    }
  }
}
