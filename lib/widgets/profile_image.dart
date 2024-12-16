// lib/widgets/profile_menu_item.dart
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String profileImageUrl;

  const ProfileImage({
    super.key,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: NetworkImage(profileImageUrl),
    );
  }
}
