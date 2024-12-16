// lib/widgets/profile_menu_item.dart
import 'package:flutter/material.dart';

class StoreImage extends StatelessWidget {
  final String storeImageUrl;

  const StoreImage({
    super.key,
    required this.storeImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2500, // Adjust the width as needed
      height: 250, // Adjust the height as needed
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(storeImageUrl),
          fit: BoxFit.cover, // Ensures the image covers the container
        ),
        borderRadius: BorderRadius.circular(10), // Adjust for rounded corners
      ),
    );
  }
}
