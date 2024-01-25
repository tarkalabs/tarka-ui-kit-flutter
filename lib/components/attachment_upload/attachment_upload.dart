import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../subcomponents/image.dart';

class TUIAttachmentUpload extends StatelessWidget {
  final String title;
  final bool isIconUsed;

  late IconData? icon;
  late TUIImage? image;

  late String description;

  late Function()? deleteTapped;
  late Function()? downloadTapped;

  TUIAttachmentUpload({
    Key? key,
    required this.title,
    required this.isIconUsed,
    this.icon,
    this.image,
    this.description = "",
    this.downloadTapped,
    this.deleteTapped,
  }) : super(key: key) {
    if (isIconUsed == true) {
      image = null;
    } else {
      icon = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getImageIcon(context, image, icon),
        getTitleAndDescription(theme),
        getTrailingButtons(theme)
      ],
    );
  }

  Widget getTitleAndDescription(TUIThemeData theme) {
    TextStyle titleTextStyle = theme.typography.body7.copyWith(
      color: theme.colors.onSurface,
    );

    TextStyle descriptionTextStyle = theme.typography.body8.copyWith(
      color: theme.colors.inputTextDim,
    );

    Text titleWidget = Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: titleTextStyle,
    );

    List<Widget> titleAndDescription = [titleWidget];

    Text descriptionWidget = Text(
      description,
      overflow: TextOverflow.ellipsis,
      style: descriptionTextStyle,
    );

    if (description.isNotEmpty) {
      titleAndDescription.add(descriptionWidget);
    }

    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: titleAndDescription,
            ),
          ),
        ),
      ),
    );
  }

  Widget getTrailingButtons(TUIThemeData theme) {
    List<Widget> trailingWidgets = [];

    if (downloadTapped != null) {
      trailingWidgets.add(GestureDetector(
        onTap: downloadTapped,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FluentIcons.arrow_download_16_filled,
            color: theme.colors.disabledContent,
          ),
        ),
      ));
    }

    if (deleteTapped != null) {
      trailingWidgets.add(
        GestureDetector(
          onTap: deleteTapped,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FluentIcons.delete_16_regular,
              color: theme.colors.disabledContent,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Row(
          children: trailingWidgets,
        ),
      ),
    );
  }

  Widget getImageIcon(BuildContext context, TUIImage? image, IconData? icon) {
    final theme = TUITheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 60,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color:
              theme.colors.surfaceVariant, // Set your desired background color
          borderRadius: BorderRadius.circular(8.0), // Set the border radius
        ),
        child: _getImageOrIcon(image, icon),
      ),
    );
  }

  Widget _getImageOrIcon(TUIImage? image, IconData? icon) {
    if (image != null) {
      return image;
    } else if (icon != null) {
      return Center(
        child: Icon(icon),
      );
    } else {
      return Placeholder();
    }
  }
}
