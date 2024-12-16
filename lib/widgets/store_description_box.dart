// lib/widgets/profile_header.dart
import 'package:flutter/material.dart';

class StoreItemDescriptionBox extends StatelessWidget {
  final String itemDescription;

  const StoreItemDescriptionBox({
    super.key,
    required this.itemDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // Aligns the text to the left 🤯
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat Bold')),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          itemDescription,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat Extra Light'),
        ),
      ],
    );
  }
}
