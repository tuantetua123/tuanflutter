import 'package:flutter/material.dart';
import 'manhinh2.dart';
import 'Chatbox.dart';
import 'thongbao.dart';
import 'profile.dart';

void main() {
  runApp(GuideApp());
}

class GuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuideScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GuideScreen extends StatelessWidget {
  final List<Guide> guides = [
    Guide(
      name: 'Cristiano Ronaldo',
      country: 'Portugal',
      date: 'Jan 30, 2020',
      location: 'Danang, Vietnam',
      imagePath: 'assets/Goat.jpg',
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      country: 'Portugal',
      date: 'Jan 30, 2020',
      location: 'Danang, Vietnam',
      imagePath: 'assets/phongcanh.jpg',
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      country: 'Portugal',
      date: 'Jan 30, 2020',
      location: 'Danang, Vietnam',
      imagePath: 'assets/phongcanh.jpg',
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      country: 'Portugal',
      date: 'Jan 30, 2020',
      location: 'Danang, Vietnam',
      imagePath: 'assets/phongcanh.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildSearchBox(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildGuideHeader(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                return GuideCard(guide: guide);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          'assets/cc.png',
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 16,
          top: 40,
          child: Text(
            'Explore',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 18),
                  SizedBox(width: 4),
                  Text(
                    'Da Nang',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.cloud, color: Colors.white, size: 18),
                  SizedBox(width: 4),
                  Text(
                    '26°C',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox() {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(Icons.search, size: 24, color: Colors.grey),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Hi, where do you want to guide?',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Finding a Guide',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'SEE MORE',
            style: TextStyle(color: Colors.teal, fontSize: 14),
          ),
        ),
      ],
    );
  }

  // New: Bottom navigation bar method
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0, // Set the active tab (Explore)
      type: BottomNavigationBarType.fixed, // Keeps all icons visible
      selectedItemColor: Colors.teal, // Highlight active icon
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        // Điều hướng đến các màn hình tương ứng khi nhấn vào từng mục
        switch (index) {
          case 0:
            // Explore
            break;
          case 1:
            // Location
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GuideListScreen()),
            );
            // Thêm logic cho Location ở đây
            break;
          case 2:
            // Chat
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
            // Thêm logic cho Chat ở đây
            break;
          case 3:
            // Notifications
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
             );
            // Thêm logic cho Notifications ở đây
            break;
          case 4:
            // Profile
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
             );
            // Thêm logic cho Profile ở đây
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Location',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}

class Guide {
  final String name;
  final String country;
  final String date;
  final String location;
  final String imagePath;

  Guide({
    required this.name,
    required this.country,
    required this.date,
    required this.location,
    required this.imagePath,
  });
}

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 100, // Increased width for larger image
                height: 100, // Increased height for larger image
                child: Image.asset(
                  guide.imagePath,
                  fit: BoxFit.fill, // Makes the image fill the entire container
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${guide.name} from ${guide.country}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Finding a Guide',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: Colors.teal),
                      SizedBox(width: 5),
                      Text(
                        guide.date,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.teal),
                      SizedBox(width: 5),
                      Text(
                        guide.location,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
