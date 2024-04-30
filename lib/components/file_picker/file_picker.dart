import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/button.dart';
import 'package:tarka_ui/components/button/style.dart';

class TUIFilePicker extends StatelessWidget {
  final bool allowMultipleFiles;
  final String title;
  final AllowedFileType allowedFileType;
  final List<String>? allowedFileExtensions;
  final Function(List<PlatformFile>?) filesPicked;

  const TUIFilePicker({
    super.key,
    required this.title,
    this.allowMultipleFiles = false,
    this.allowedFileType = AllowedFileType.any,
    this.allowedFileExtensions,
    required this.filesPicked,
  });

  @override
  Widget build(BuildContext context) {
    return TUIButton(
        label: title,
        type: TUIButtonType.primary,
        onPressed: () {
          openFiles();
        });
  }

  Future<void> openFiles() async {
    List<String> allowedFileExtensions = this.allowedFileExtensions ?? [];

    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
        type: allowedFileType.getFileType(),
        allowedExtensions: allowedFileExtensions,
        allowMultiple: allowMultipleFiles);

    if (resultFile != null) {
      List<PlatformFile> pickedFiles = resultFile.files;
      filesPicked(pickedFiles);
    }
  }
}

enum AllowedFileType { any, media, image, video, audio, custom }

extension AllowedFileTypeExtension on AllowedFileType {
  FileType getFileType() {
    switch (this) {
      case AllowedFileType.any:
        return FileType.any;
      case AllowedFileType.media:
        return FileType.media;
      case AllowedFileType.image:
        return FileType.image;
      case AllowedFileType.video:
        return FileType.video;
      case AllowedFileType.audio:
        return FileType.audio;
      case AllowedFileType.custom:
        return FileType.custom;
    }
  }
}
