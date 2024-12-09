import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0), // Add padding inside the box
          width: 400,
          child: ListView(
            children: [
              // Adding padding to "Account Settings"
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // Add padding here
                child: Text(
                  "Account Settings",
                  style: TextStyle(
                      fontWeight: FontWeight.w100, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
              ), // Adds padding below the text
              ListTile(
                title: Text('Edit profile'),
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () {
                  // Navigate to edit profile screen
                },
              ),
              ListTile(
                title: Text('Change password'),
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () {
                  // Navigate to change password screen
                },
              ),
              ListTile(
                title: Text('Change username'),
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () {
                  // Navigate to change password screen
                },
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Divider(
                color: Colors.grey,
                thickness: 0.2,
              ), // Another horizontal line
              Padding(padding: EdgeInsets.only(bottom: 16)),
              // Adding padding to "More"
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // Add padding here
                child: Text(
                  "More",
                  style: TextStyle(
                      fontWeight: FontWeight.w100, color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
              ), // Adds padding below the text
              ListTile(
                title: Text('Push Notifications'),
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () {
                  // Navigate to edit profile screen
                },
              ),
              ListTile(
                title: Text('About Us'),
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () {
                  // Navigate to change password screen
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                onTap: () {
                  // Navigate to change password screen
                },
              )
              // Add more list tiles for other settings options
            ],
          ),
        ),
      ),
    );
  }
}
