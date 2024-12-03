import 'package:flutter/material.dart';
import 'main1.dart';
import 'manhinh2.dart';
import 'profile.dart';
import 'Chatbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200, // Height of the app bar
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cc.png'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            'Cristiano Ronaldo',
            'Cristiano Ronaldo chose you for the trip in Danang, Vietnam on Jan 20, 2020',
            'Jan 16',
            Icons.location_on,
            Colors.orange,
          ),
          _buildNotificationItem(
            'Cristiano Ronaldo',
            'Cristiano Ronaldo paid upfront 50% for the trip in Danang, Vietnam on Jan 20, 2020. You can start the trip as scheduled.',
            'Jan 16',
            Icons.attach_money,
            Colors.green,
          ),
          _buildNotificationItem(
            'Cristiano Ronaldo',
            'Cristiano Ronaldo left a review for you',
            'Jan 24',
            Icons.rate_review,
            Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3, // Set the active tab (Notifications)
      type: BottomNavigationBarType.fixed, // Keeps all icons visible
      selectedItemColor: Colors.teal, // Highlight active icon
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GuideScreen()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GuideListScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
            break;
          case 3:
            // Stay on Notifications screen
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Location',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Settings',
        ),
      ],
    );
  }

  Widget _buildNotificationItem(String name, String message, String date, IconData icon, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/goat.jpg'), // Replace with your image
        radius: 25,
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          Text(date, style: TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: iconColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}