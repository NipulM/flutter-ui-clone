// lib/screens/profile_screen.dart
// igonre_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/profile_header.dart';
import 'package:flutter_application_1/widgets/profile_image.dart';
import 'package:flutter_application_1/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0), // Add padding inside the box
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child:
                        const ProfileImage(profileImageUrl: "profileImageUrl")),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                const ProfileHeader(
                  name: "Michonne",
                  accountLevel: 10,
                  profileImageUrl: "https://via.placeholder.com/100",
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Divider(
                  color: Colors.grey,
                  thickness: 0.2,
                ),
                const SizedBox(height: 16),
                const ProfileMenuItem(
                  title: "Personal Details",
                  icon: Icons.person_outline,
                ),
                const ProfileMenuItem(
                  title: "My Card",
                  icon: Icons.credit_card_outlined,
                ),
                const ProfileMenuItem(
                  title: "My Orders",
                  icon: Icons.shopping_bag_outlined,
                ),
                const ProfileMenuItem(
                  title: "Settings",
                  icon: Icons.settings_outlined,
                ),
                const ProfileMenuItem(
                  title: "FAQs",
                  icon: Icons.question_answer_outlined,
                ),
                const ProfileMenuItem(
                  title: "Privacy Policy",
                  icon: Icons.lock_outline,
                ),
                const ProfileMenuItem(
                  title: "Terms and Conditions",
                  icon: Icons.document_scanner_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
