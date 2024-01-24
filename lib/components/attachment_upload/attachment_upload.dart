import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../subcomponents/image.dart';

class TUIAttachmentUpload extends StatefulWidget {
  final String title;
  final bool showDescription;
  late String description;
  final bool showDownloadButton;
  final bool showDeleteButton;

  final bool isIconUsed;
  late IconData? icon;
  late TUIImage? image;

  late Function()? deleteTapped;
  late Function()? downloadTapped;

  TUIAttachmentUpload(
      {Key? key,
      this.title = "",
      this.showDescription = false,
      this.description = "",
      this.downloadTapped,
      this.deleteTapped,
      this.showDeleteButton = false,
      this.showDownloadButton = false,
      this.icon,
      this.image,
      required this.isIconUsed})
      : super(key: key) {
    if (showDeleteButton == false) {
      deleteTapped = null;
    }
    if (showDownloadButton == false) {
      downloadTapped = null;
    }
    if (showDescription == false) {
      description = "";
    }

    if (isIconUsed == true) {
      image = null;
    } else {
      icon = null;
    }
  }

  @override
  State<TUIAttachmentUpload> createState() => _TUIAttachmentUploadState();
}

class _TUIAttachmentUploadState extends State<TUIAttachmentUpload> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [getImageIcon(context, widget.image, widget.icon)],
    );
  }

  Widget getImageIcon(BuildContext context, TUIImage? image, IconData? icon) {
    final theme = TUITheme.of(context);

    return Container(
      width: 80,
      height: 60,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: theme.colors.surfaceVariant, // Set your desired background color
        borderRadius: BorderRadius.circular(8.0), // Set the border radius
      ),
      child: _getImageOrIcon(image, icon),
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
