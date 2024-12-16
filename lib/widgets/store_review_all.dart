// lib/widgets/profile_header.dart
import 'package:flutter/material.dart';

class StoreItemReviewAllHeader extends StatelessWidget {
  const StoreItemReviewAllHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Reviews",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat Bold')),
        Text("See All",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat Extra Light')),
      ],
    );
  }
}
