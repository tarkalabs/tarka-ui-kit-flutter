import 'package:flutter/material.dart';

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
