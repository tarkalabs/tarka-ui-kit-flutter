import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/default_colors.dart';
import 'package:tarka_ui/subcomponents/image.dart';

class TUIMediaThumbnail extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isSelectable;
  final TUIMediaThumbnailSize size;
  final TUIMediaThumbnailType mediaType;
  final TUIImage? customThumbnailImage;

  const TUIMediaThumbnail({
    Key? key,
    this.onPressed,
    this.isSelectable = true,
    required this.size,
    required this.mediaType,
    this.customThumbnailImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSelectable == true) {
      return GestureDetector(
        onTap: onPressed,
        child: getBody(),
      );
    } else {
      return getBody();
    }
  }

  ClipRRect? getBackgroundImage() {
    if ([TUIMediaThumbnailType.document, TUIMediaThumbnailType.audio]
        .contains(mediaType)) {
      return null;
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: customThumbnailImage,
      );
    }
  }

  Row getBody() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: decorate(),
              height: size.height,
              width: size.width,
            ),
            getBackgroundImage(),
            getIsSelectableIcon(),
            getCenterIconWidget()
          ].whereType<Widget>().toList(),
        )
      ],
    );
  }

  SizedBox? getCenterIconWidget() {
    if (TUIMediaThumbnailType.document == mediaType) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: Icon(
                FluentIcons.document_16_regular,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    } else if (TUIMediaThumbnailType.audio == mediaType) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: Icon(
                FluentIcons.device_eq_20_filled,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    } else if (TUIMediaThumbnailType.video == mediaType) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            decoration: decorateIcon(),
            width: 24,
            height: 24,
            child: const Center(
              child: Icon(
                FluentIcons.play_16_regular,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),
      );
    }

    return null;
  }

  Widget? getIsSelectableIcon() {
    if (isSelectable == false) {
      return null;
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 4, right: 4),
        child: Container(
          decoration: decorateIcon(),
          width: 20,
          height: 20,
          child: Center(
            child: Icon(
              getIsSelectableIconImage(),
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
      );
    }
  }

  IconData getIsSelectableIconImage() {
    return (mediaType == TUIMediaThumbnailType.audio)
        ? FluentIcons.play_12_regular
        : FluentIcons.eye_12_filled;
  }

  BoxDecoration decorateIcon() {
    return const BoxDecoration(
        color: Color.fromARGB(153, 0, 0, 0),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ));
  }

  BoxDecoration decorate() {
    return const BoxDecoration(
      color: TUIDefaultColors.surfaceVariant,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}

enum TUIMediaThumbnailSize {
  large(80, 60),
  regular(52, 40);

  const TUIMediaThumbnailSize(this.width, this.height);

  final double width;
  final double height;
}

enum TUIMediaThumbnailType {
  photo,
  video,
  document,
  audio;
}
