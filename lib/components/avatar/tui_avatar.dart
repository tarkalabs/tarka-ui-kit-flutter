import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tui_colors.dart';
import 'package:tarka_ui/styles/tui_text_style.dart';

/// TUIAvatar is used to create a Avatar with content, size and badge flag.
class TUIAvatar extends StatelessWidget {
  final TUIAvatarSize avatarSize;
  final TUIAvatarContent avatarContent;
  final Color? textColor;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool isBadged;

  const TUIAvatar({
    super.key,
    required this.avatarSize,
    required this.avatarContent,
    this.textColor = TUIColors.onTertiary,
    this.foregroundColor = TUIColors.constantLight,
    this.backgroundColor = TUIColors.tertiary,
    this.isBadged = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget circleChild;

    if (avatarContent.icon != null) {
      circleChild = Icon(
        avatarContent.icon,
        size: avatarSize._size / 2,
        color: TUIColors.constantLight,
      );
    } else if (avatarContent.text != null) {
      TextStyle textStyle = avatarSize._textStyle.copyWith(
            color: textColor,
          );

      circleChild = Text(
        avatarContent.text!,
        style: textStyle,
      );
    } else {
      circleChild = ClipOval(child: avatarContent.image!);
    }

    CircleAvatar circleAvatar = CircleAvatar(
      radius: avatarSize._size / 2,
      backgroundColor: backgroundColor,
      child: circleChild,
    );

    if (isBadged) {
      return LayoutBuilder(
        builder: (context, constraints) {
          Positioned badge;

          if (constraints.maxHeight != double.infinity) {
            badge = Positioned(
              left: constraints.maxWidth / 2 + avatarSize._size / 4,
              top: constraints.maxHeight / 2 + avatarSize._size / 4,
              child: Container(
                height: avatarSize._badgeSize,
                width: avatarSize._badgeSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TUIColors.success,
                ),
              ),
            );
          } else {
            badge = Positioned(
              left: constraints.maxWidth / 2 + avatarSize._size / 4,
              bottom: 0,
              child: Container(
                height: avatarSize._badgeSize,
                width: avatarSize._badgeSize,
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
                  width: avatarSize._size,
                  height: avatarSize._size,
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
  final IconData? icon;
  final TUIImage? image;
  final String? text;

  TUIAvatarContent({required this.type, this.icon, this.image, this.text});
}

/// TUIAvatarContentType is used to define the content type of Avatar.
enum TUIAvatarContentType { image, icon, text }

/// TUIAvatarSize is used to define the size of Avatar.
enum TUIAvatarSize {
  xxs(size: 24, badgeSize: 12, textStyle: TUITextStyle.body8),
  xs(size: 32, badgeSize: 12, textStyle: TUITextStyle.heading7),
  s(size: 40, badgeSize: 12, textStyle: TUITextStyle.heading6),
  m(size: 48, badgeSize: 12, textStyle: TUITextStyle.heading5),
  l(size: 64, badgeSize: 16, textStyle: TUITextStyle.heading4),
  xl(size: 80, badgeSize: 24, textStyle: TUITextStyle.heading3),
  xxl(size: 96, badgeSize: 24, textStyle: TUITextStyle.heading2);

  const TUIAvatarSize(
      {required double size,
      required double badgeSize,
      required TextStyle textStyle})
      : _size = size,
        _badgeSize = badgeSize,
        _textStyle = textStyle;

  final double _size;
  final double _badgeSize;
  final TextStyle _textStyle;
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
