import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tk_colors.dart';
import 'package:tarka_ui/styles/tk_text_style.dart';

enum TKAvatarSize {
  XXS,
  XS,
  S,
  M,
  L,
  XL,
  XXL;

  Size getAvatarSize() {
    switch (this) {
      case TKAvatarSize.XXS:
        return const Size(24, 24);
      case TKAvatarSize.XS:
        return const Size(32, 32);
      case TKAvatarSize.S:
        return const Size(40, 40);
      case TKAvatarSize.M:
        return const Size(48, 48);
      case TKAvatarSize.L:
        return const Size(64, 64);
      case TKAvatarSize.XL:
        return const Size(80, 80);
      case TKAvatarSize.XXL:
        return const Size(96, 96);
    }
  }
}

enum TKAvatarContentType { image, icon, text }

class TKAvatarContent {
  final TKAvatarContentType type;
  final Icon? icon;
  final TKImage? image;
  final String? text;

  TKAvatarContent({required this.type, this.icon, this.image, this.text});
}

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
        size: avatarSize.getAvatarSize().width / 2,
        color: TKColors.constantLight,
      );
    } else if (avatarContent.text != null) {
      TextStyle textStyle = getTextStyleForAvatarSize(avatarSize).copyWith(
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
      radius: avatarSize.getAvatarSize().width / 2,
      backgroundColor: TKColors.tertiary,
      child: circleChild,
    );

    return circleAvatar;
  }

  TextStyle getTextStyleForAvatarSize(TKAvatarSize avatarSize) {
    switch (avatarSize) {
      case TKAvatarSize.XXS:
        return TKTextStyle.body8;
      case TKAvatarSize.XS:
        return TKTextStyle.heading7;
      case TKAvatarSize.S:
        return TKTextStyle.heading6;
      case TKAvatarSize.M:
        return TKTextStyle.heading5;
      case TKAvatarSize.L:
        return TKTextStyle.heading4;
      case TKAvatarSize.XL:
        return TKTextStyle.heading3;
      case TKAvatarSize.XXL:
        return TKTextStyle.heading2;
    }
  }
}

// Wrapper class to handle both network image and asset image
class TKImage extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;

  const TKImage({
    this.imageUrl,
    this.assetPath,
  }) : assert(
          imageUrl != null || assetPath != null,
          'imageUrl or assetPath must be provided.',
        );

  @override
  Image build(BuildContext context) {
    if (assetPath != null) {
      return Image.asset(
        assetPath!,
      );
    } else {
      return Image.network(
        imageUrl!,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Text('Failed to load image');
        },
      );
    }
  }
}
