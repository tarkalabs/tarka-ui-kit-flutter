import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/default_colors.dart';
import 'package:tarka_ui/styles/text_style.dart';
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
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool isBadged;

  const TUIAvatar({
    super.key,
    required this.avatarSize,
    required this.avatarContent,
    this.textColor = TUIDefaultColors.onTertiary,
    this.foregroundColor = TUIDefaultColors.constantLight,
    this.backgroundColor = TUIDefaultColors.tertiary,
    this.isBadged = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget circleChild;

    if (avatarContent.icon != null) {
      circleChild = Icon(
        avatarContent.icon,
        size: avatarSize._size / 2,
        color: TUIDefaultColors.constantLight,
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
                  color: TUIDefaultColors.success,
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
                  color: TUIDefaultColors.success,
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
