import 'package:flutter/material.dart';

class GuideDetails extends StatelessWidget {
  final String name;
  final String country;
  final String date;
  final String location;
  final String imageAsset;

  GuideDetails({
    required this.name,
    required this.country,
    required this.date,
    required this.location,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of $name'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(imageAsset),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'From $country',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  location,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
