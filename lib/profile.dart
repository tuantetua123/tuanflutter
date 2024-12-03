import 'package:flutter/material.dart';
import 'main.dart';
import 'Editprofile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true; // Biến trạng thái cho Switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
      ),
      body: Column(
        children: [
          // Phần Header của profile
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.blue,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/7.jpg'), // Đảm bảo có hình ảnh ở đây
                  radius: 30,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cristiano Ronaldo',  // Cập nhật tên
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Goat',  // Cập nhật vai trò
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileEditPage()),
                    );
                    // Điều hướng đến trang chỉnh sửa hồ sơ (tùy chỉnh nếu cần)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('EDIT PROFILE'),
                ),
              ],
            ),
          ),

          // Các tùy chọn cài đặt
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                buildSettingsTile(
                  Icons.notifications,
                  'Notifications',
                  trailing: Switch(
                    value: _notificationsEnabled,
                    onChanged: (val) {
                      setState(() {
                        _notificationsEnabled = val;
                      });
                    },
                  ),
                ),
                buildSettingsTile(Icons.language, 'Languages'),
                buildSettingsTile(Icons.payment, 'Payment Info'),
                buildSettingsTile(Icons.bar_chart, 'Income Stats'),
                buildSettingsTile(Icons.policy, 'Privacy & Policies'),
                buildSettingsTile(Icons.feedback, 'Feedback'),
                buildSettingsTile(Icons.book, 'Usage'),
              ],
            ),
          ),

          // Nút đăng xuất
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignInScreen()),
                            );
                // Thêm logic đăng xuất ở đây
              },
              child: Text(
                'Sign out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function để xây dựng các mục cài đặt
  ListTile buildSettingsTile(IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios), // Nếu trailing là null, dùng biểu tượng mũi tên
      onTap: () {
        // Thêm chức năng điều hướng hoặc xử lý từng mục cài đặt
      },
    );
  }
}
