import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/subcomponents/image.dart';

import '../badge/badge.dart';

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

    Widget avatar = ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          alignment: Alignment.center,
          width: avatarSize._size,
          height: avatarSize._size,
          color: backgroundColor,
          child: circleChild,
        ));

    if (isBadged) {
      Positioned? badge = Positioned(
        right: getPaddingForSize(),
        bottom: getPaddingForSize(),
        child: TUIBadge(
          badgeSize: avatarSize._badgeSize,
          badgeColor: colors.success,
        ),
      );
      return Center(
        child: SizedBox(
          width: avatarSize._size,
          height: avatarSize._size,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [avatar, badge],
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          width: avatarSize._size,
          height: avatarSize._size,
          child: avatar,
        ),
      );
    }
  }

  double getPaddingForSize() {
    return avatarSize._badgeSize == TUIBadgeSize.l ? -8 : -4;
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
  xxs(size: 24, badgeSize: TUIBadgeSize.s),
  xs(size: 32, badgeSize: TUIBadgeSize.s),
  s(size: 40, badgeSize: TUIBadgeSize.s),
  m(size: 48, badgeSize: TUIBadgeSize.s),
  l(size: 64, badgeSize: TUIBadgeSize.m),
  xl(size: 80, badgeSize: TUIBadgeSize.l),
  xxl(size: 96, badgeSize: TUIBadgeSize.l);

  const TUIAvatarSize({required double size, required TUIBadgeSize badgeSize})
      : _size = size,
        _badgeSize = badgeSize;

  final double _size;
  final TUIBadgeSize _badgeSize;

  TextStyle _getTextStyle(TUIThemeData theme) {
    switch (this) {
      case TUIAvatarSize.xxs:
        return theme.typography.xsSemiBold;
      case TUIAvatarSize.xs:
        return theme.typography.smBold;
      case TUIAvatarSize.s:
        return theme.typography.baseBold;
      case TUIAvatarSize.m:
        return theme.typography.lgSemiBold;
      case TUIAvatarSize.l:
        return theme.typography.xlSemiBold;
      case TUIAvatarSize.xl:
        return theme.typography.xl2SemiBold;
      case TUIAvatarSize.xxl:
        return theme.typography.xl3Bold;
    }
  }
}
