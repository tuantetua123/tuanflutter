import 'package:flutter/material.dart';
import 'main1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt banner debug
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 231, 105),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 100, 231, 105),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                right: 83,
                child: Image.asset('assets/line.png', height: 60),
              ),
              Positioned(
                top: 70,
                right: 60,
                child: Image.asset('assets/cloud.png', height: 60),
              ),
              Positioned(
                top: 50,
                right: 30,
                child: Image.asset('assets/maybay.png', height: 60),
              ),
            ],
          ),
          Expanded(
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Sign In',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Welcome back, Van Tuan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: true, // Sửa đúng cú pháp
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                            );
                          },
                          child: const Text('Forgot Password'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                      onPressed: () {
                        // Điều hướng đến màn hình ExploreScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GuideApp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Đổi màu chữ thành trắng
                        ),
                      ),
                    ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/face.jpg', height: 40, width: 40),
                            iconSize: 40,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/talk.jpg', height: 40, width: 40),
                            iconSize: 40,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/line.jpg', height: 40, width: 40),
                            iconSize: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text('Don\'t have an account? Sign Up'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedRole = 'Traveler'; // Biến lưu trữ giá trị của nút chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 233, 124),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 120, 233, 124),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                right: 83,
                child: Image.asset('assets/line.png', height: 60),
              ),
              Positioned(
                top: 70,
                right: 60,
                child: Image.asset('assets/cloud.png', height: 60),
              ),
              Positioned(
                top: 50,
                right: 30,
                child: Image.asset('assets/maybay.png', height: 60),
              ),
            ],
          ),
          Expanded(
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView( // Thêm tính năng cuộn
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),

                        // Thêm hàng chứa 2 nút chọn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Traveler'),
                                value: 'Traveler',
                                groupValue: _selectedRole,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedRole = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Guide'),
                                value: 'Guide',
                                groupValue: _selectedRole,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedRole = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'First Name',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last Name',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Center(
                          child: TextButton(
                            onPressed: () {
                              
                            },
                            child: Text('By Signing Up, you agree to our Terms & Conditions'),
                          ),
                        ),

                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignInScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.0),
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Already have an account? Sign In'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 233, 124),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 120, 233, 124),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                right: 83,
                child: Image.asset('assets/line.png', height: 60),
              ),
              Positioned(
                top: 70,
                right: 60,
                child: Image.asset('assets/cloud.png', height: 60),
              ),
              Positioned(
                top: 50,
                right: 30,
                child: Image.asset('assets/maybay.png', height: 60),
              ),
            ],
          ),
          Expanded(
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Forgot Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Input your email, we will send you an instruction to reset your password.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );
                          // Xử lý khi nhấn nút SEND
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                        child: const Text(
                          'SEND',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Back to Sign Up',
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.05);
    path.quadraticBezierTo(size.width / 2, -size.height * 0.05, size.width, size.height * 0.05);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
