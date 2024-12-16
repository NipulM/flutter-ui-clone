// lib/widgets/profile_header.dart
import 'package:flutter/material.dart';

class StoreItemPersonReview extends StatelessWidget {
  final String reviewDateAgo;
  final String reviewPersonName;
  final String reviewDescription;

  const StoreItemPersonReview({
    super.key,
    required this.reviewDateAgo,
    required this.reviewPersonName,
    required this.reviewDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewPersonName,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat Light'),
                ),
                Row(children: [
                  Icon(Icons.star,
                      color: const Color.fromARGB(255, 249, 223, 31)),
                  Icon(Icons.star,
                      color: const Color.fromARGB(255, 249, 223, 31)),
                  Icon(Icons.star,
                      color: const Color.fromARGB(255, 249, 223, 31)),
                  Icon(Icons.star,
                      color: const Color.fromARGB(255, 249, 223, 31)),
                  Icon(Icons.star,
                      color: const Color.fromARGB(255, 249, 223, 31))
                ])
              ],
            ),
            Text(
              reviewDateAgo,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat Extra Light'),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          reviewDescription,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat Light'),
        ),
      ],
    );
  }
}
