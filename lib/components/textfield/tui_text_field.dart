import 'package:flutter/material.dart';

class TUITextField extends StatelessWidget {
  const TUITextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
            labelText: 'Label',
            suffixText: '%',
            prefixText: '7',
            prefixIcon: IconButton(
                onPressed: null,
                icon: Icon(Icons.phone)),
            suffixIcon: IconButton(
              onPressed: null,
              icon: Icon(Icons.phone),
            )));
  }
}
