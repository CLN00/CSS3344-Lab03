import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;

  const DescriptionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(height: 1.5, fontSize: 14),
        softWrap: true,
      ),
    );
  }
}