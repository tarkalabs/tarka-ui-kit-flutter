import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tk_colors.dart';
import 'package:tarka_ui/styles/tk_text_style.dart';

/// TKAvatar is used to create a Avatar with content, size and badge flag.
class TKAvatar extends StatelessWidget {
  final TKAvatarSize avatarSize;
  final TKAvatarContent avatarContent;
  final bool isBadged;

  const TKAvatar({
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
        color: TKColors.constantLight,
      );
    } else if (avatarContent.text != null) {
      TextStyle textStyle = avatarSize._getTextStyle().copyWith(
            color: TKColors.onTertiary,
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
      backgroundColor: TKColors.tertiary,
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
                  color: TKColors.success,
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
                  color: TKColors.success,
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

/// TKAvatarContent stores the content type and the content for the Avatar.
class TKAvatarContent {
  final TKAvatarContentType type;
  final Icon? icon;
  final TKImage? image;
  final String? text;

  TKAvatarContent({required this.type, this.icon, this.image, this.text});
}

/// TKAvatarContentType is used to define the content type of Avatar.
enum TKAvatarContentType { image, icon, text }

/// TKAvatarSize is used to define the size of Avatar.
enum TKAvatarSize {
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl;

  double _getAvatarSize() {
    switch (this) {
      case TKAvatarSize.xxs:
        return 24;
      case TKAvatarSize.xs:
        return 32;
      case TKAvatarSize.s:
        return 40;
      case TKAvatarSize.m:
        return 48;
      case TKAvatarSize.l:
        return 64;
      case TKAvatarSize.xl:
        return 80;
      case TKAvatarSize.xxl:
        return 96;
    }
  }

  double _getBadgeSize() {
    switch (this) {
      case TKAvatarSize.xxs:
      case TKAvatarSize.xs:
      case TKAvatarSize.s:
      case TKAvatarSize.m:
        return 12;
      case TKAvatarSize.l:
        return 16;
      case TKAvatarSize.xl:
      case TKAvatarSize.xxl:
        return 24;
    }
  }

  TextStyle _getTextStyle() {
    switch (this) {
      case TKAvatarSize.xxs:
        return TKTextStyle.body8;
      case TKAvatarSize.xs:
        return TKTextStyle.heading7;
      case TKAvatarSize.s:
        return TKTextStyle.heading6;
      case TKAvatarSize.m:
        return TKTextStyle.heading5;
      case TKAvatarSize.l:
        return TKTextStyle.heading4;
      case TKAvatarSize.xl:
        return TKTextStyle.heading3;
      case TKAvatarSize.xxl:
        return TKTextStyle.heading2;
    }
  }
}

/// TKImage is used as an abstraction to handle asset and network image.
class TKImage extends StatelessWidget {
  final String? _imageUrl;
  final String? _assetPath;

  const TKImage({
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
