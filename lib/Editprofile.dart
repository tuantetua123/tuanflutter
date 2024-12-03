import 'package:flutter/material.dart';

void main() => runApp(ProfileEditApp());

class ProfileEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileEditPage(),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {
              // Add save functionality
            },
            child: Text(
              'SAVE',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/17.jpg'), // Replace with your image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.blue),
                      onPressed: () {
                        // Add functionality to change profile picture
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add password change functionality
              },
              child: Text('Change Password', style: TextStyle(color: Colors.blue)),
            ),
            
            // Address Fields
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(labelText: 'City'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _countryController,
                    decoration: InputDecoration(labelText: 'Country'),
                  ),
                ),
              ],
            ),
            
            // Phone Number Field
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone number',
                prefixText: '(+84) ',
              ),
            ),
            
            // Available Time Field
            TextButton(
              onPressed: () {
                // Add functionality to change available time
              },
              child: Text('Change Available time', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
