import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/subcomponents/image.dart';

/// TUIAvatar is used to create a Avatar with content, size and badge flag.
///
///   Example:
///     ```dart
///   TUIAvatar(
///     avatarSize: TUIAvatarSize.xs,
///     avatarContent: TUIAvatarContent(
///       type: TUIAvatarContentType.image,
///       image: TUIImage(
///         imageUrl: 'https://picsum.photos/200/300',
///       ),
///     ),
///     isBadged: true,
///   )
///   ```

class TUIAvatar extends StatelessWidget {
  final TUIAvatarSize avatarSize;
  final TUIAvatarContent avatarContent;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isBadged;

  const TUIAvatar({
    super.key,
    required this.avatarSize,
    required this.avatarContent,
    this.textColor,
    this.backgroundColor,
    this.isBadged = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget circleChild;
    TUIThemeData theme = TUITheme.of(context);
    final colors = theme.colors;
    final textColor = this.textColor ?? colors.onTertiary;
    final backgroundColor = this.backgroundColor ?? colors.tertiary;

    if (avatarContent.icon != null) {
      circleChild = Icon(
        avatarContent.icon,
        size: avatarSize._size / 2,
        color: colors.constantLight,
      );
    } else if (avatarContent.text != null) {
      TextStyle textStyle = avatarSize._getTextStyle(theme).copyWith(
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.success,
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.success,
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
  xxs(size: 24, badgeSize: 12),
  xs(size: 32, badgeSize: 12),
  s(size: 40, badgeSize: 12),
  m(size: 48, badgeSize: 12),
  l(size: 64, badgeSize: 16),
  xl(size: 80, badgeSize: 24),
  xxl(size: 96, badgeSize: 24);

  const TUIAvatarSize({required double size, required double badgeSize})
      : _size = size,
        _badgeSize = badgeSize;

  final double _size;
  final double _badgeSize;

  TextStyle _getTextStyle(TUIThemeData theme) {
    switch (this) {
      case TUIAvatarSize.xxs:
        return theme.typography.body8;
      case TUIAvatarSize.xs:
        return theme.typography.heading7;
      case TUIAvatarSize.s:
        return theme.typography.heading6;
      case TUIAvatarSize.m:
        return theme.typography.heading5;
      case TUIAvatarSize.l:
        return theme.typography.heading4;
      case TUIAvatarSize.xl:
        return theme.typography.heading3;
      case TUIAvatarSize.xxl:
        return theme.typography.heading2;
    }
  }
}
