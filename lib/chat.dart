import 'package:flutter/material.dart';
import 'main1.dart';
import 'manhinh2.dart';
import 'thongbao.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreens(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cc.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                'Chat',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Chat',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildChatItem(context, 'Cristiano Ronaldo', 'It\'s a beautiful place', '2', 'assets/goat.jpg'),
                _buildChatItem(context, 'Cristiano Ronaldo', 'We can start at 8am', '10:30 AM', 'assets/goat.jpg'),
                _buildChatItem(context, 'Cristiano Ronaldo', 'See you tomorrow', '11:30 AM', 'assets/goat.jpg'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => GuideScreen()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => GuideListScreen()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
            break;
          case 4:
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  Widget _buildChatItem(
    BuildContext context,
    String name,
    String message,
    String timeOrNotification,
    String imagePath,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 25,
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (timeOrNotification.contains(':'))
            Text(timeOrNotification, style: TextStyle(color: Colors.grey)),
          if (!timeOrNotification.contains(':'))
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Text(timeOrNotification, style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: name,
              message: message,
              imagePath: imagePath,
            ),
          ),
        );
      },
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String message;
  final String imagePath;

  ChatDetailScreen({
    required this.name,
    required this.message,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(name),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Message:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.reply),
                  label: Text('Reply'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
