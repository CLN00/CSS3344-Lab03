import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int ratingCount;
  final bool isStarred;
  final VoidCallback onStarPressed;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.ratingCount,
    required this.isStarred,
    required this.onStarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onStarPressed,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    isStarred ? Icons.star : Icons.star_border,
                    color: Colors.amber[700],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$ratingCount',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}