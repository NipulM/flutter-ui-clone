import 'package:flutter/material.dart';

class ListTileComponent extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget trailing;

  ListTileComponent({
    required this.title,
    required this.onTap,
    this.trailing = const Icon(Icons.arrow_back_ios), // Default icon size
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
