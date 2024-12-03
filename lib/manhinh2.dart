import 'package:flutter/material.dart';
import 'main1.dart';
import 'profile.dart';
import 'thongbao.dart';
import 'Chatbox.dart';

void main() {
  runApp(GuideApp());
}

class GuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Màn hình chính là HomeScreen
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0, // Set the active tab (Explore)
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
              MaterialPageRoute(builder: (context) => GuideListScreen()),
            );
            break;
          case 1:
            // Điều hướng đến màn hình khác (ví dụ: Location)
            break;
          case 2:
            // Điều hướng đến màn hình Chat
            break;
          case 3:
            // Điều hướng đến màn hình Notifications
            break;
          case 4:
            // Điều hướng đến màn hình Profile
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

class GuideListScreen extends StatelessWidget {
  final List<Guide> guides = [
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Danang, Vietnam',
      imagePath: 'assets/7.jpg',
      rating: 4,
      reviewCount: 777,
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Hanoi, Vietnam',
      imagePath: 'assets/Siuuuu.jpg',
      rating: 5,
      reviewCount: 77,
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Danang, Vietnam',
      imagePath: 'assets/17.jpg',
      rating: 4.5,
      reviewCount: 777,
    ),
    Guide(
      name: 'Cristiano Ronaldo',
      location: 'Ho Chi Minh, Vietnam',
      imagePath: 'assets/27.jpg',
      rating: 3.5,
      reviewCount: 777,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildGuideHeader(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildGuideGrid(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildGuideHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Guides in Danang',
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

  Widget _buildGuideGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemCount: guides.length,
      itemBuilder: (context, index) {
        final guide = guides[index];
        return GuideCard(guide: guide);
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1, // Set the active tab (Explore)
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
            // Navigate to Location screen
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
            // Navigate to Chat screen
            break;
          case 3:
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
             );
            // Navigate to Notifications screen
            break;
          case 4:
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
             );
            // Navigate to Profile screen
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
  final String location;
  final String imagePath;
  final double rating;
  final int reviewCount;

  Guide({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
  });
}

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GuideDetailScreen(guide: guide)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  guide.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Text(
                guide.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.teal),
                  SizedBox(width: 4),
                  Text(
                    guide.location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      guide.rating.round(),
                      (index) => Icon(Icons.star, size: 16, color: Colors.amber),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '${guide.reviewCount} Reviews',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuideDetailScreen extends StatelessWidget {
  final Guide guide;

  const GuideDetailScreen({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(guide.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                guide.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              guide.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              guide.location,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(
                guide.rating.round(),
                (index) => Icon(Icons.star, size: 20, color: Colors.amber),
              ),
            ),
            SizedBox(height: 8),
            Text('${guide.reviewCount} Reviews'),
            // Thêm thông tin chi tiết khác nếu cần
          ],
        ),
      ),
    );
  }
}
