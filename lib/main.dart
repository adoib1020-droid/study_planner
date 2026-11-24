// Group: 13
// Members (Student IDs):
// 1.27052/2024
// 2.26344/2024
// 3.26345/2024
// 4.26488/2024
// 5.26218/2024

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// STATIC - Root Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudyPlannerScreen(),
    );
  }
}

// STATIC - Home Screen
class StudyPlannerScreen extends StatelessWidget {
  const StudyPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC - AppBar
      appBar: AppBar(
        title: const Text('My Study Planner'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // STATIC - Body Content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // STATIC - Heading
            Text(
              'My Study Goals',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            // STATIC - Hard-coded Goal Cards
            Card(
              child: ListTile(
                title: Text('Mobile App Development'),
                subtitle: Text('3 hours'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Cloud Computing'),
                subtitle: Text('2 hours'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Mobile Communication'),
                subtitle: Text('4 hours'),
              ),
            ),
          ],
        ),
      ),

      // STATIC - Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}