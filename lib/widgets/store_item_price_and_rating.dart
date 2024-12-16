// lib/widgets/profile_header.dart
import 'package:flutter/material.dart';

class StoreItemPriceAndRating extends StatelessWidget {
  final int itemPrice;

  const StoreItemPriceAndRating({
    super.key,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${itemPrice.toString()}',
          style: TextStyle(
              color: const Color.fromARGB(255, 66, 66, 181),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat Bold'),
        ),
        Row(
          children: [
            Icon(Icons.star, color: const Color.fromARGB(255, 249, 223, 31)),
            Icon(Icons.star, color: const Color.fromARGB(255, 249, 223, 31)),
            Icon(Icons.star, color: const Color.fromARGB(255, 249, 223, 31)),
            Icon(Icons.star, color: const Color.fromARGB(255, 249, 223, 31)),
            Icon(Icons.star, color: const Color.fromARGB(255, 249, 223, 31)),
          ],
        ),
      ],
    );
  }
}
