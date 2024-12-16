// lib/widgets/profile_header.dart
import 'package:flutter/material.dart';

class StoreItemHeader extends StatelessWidget {
  final String itemName;

  const StoreItemHeader({
    super.key,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          itemName,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat Bold'),
        ),
      ],
    );
  }
}
