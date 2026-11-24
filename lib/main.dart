// Group: 13
// Members (Student IDs):
// 1. 27052/2024
// 2. 26344/2024
// 3. 26345/2024
// 4. 26488/2024
// 5. 26218/2024

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
class StudyPlannerScreen extends StatefulWidget {
  const StudyPlannerScreen({super.key});

  @override
  State<StudyPlannerScreen> createState() => _StudyPlannerScreenState();
}

class _StudyPlannerScreenState extends State<StudyPlannerScreen> {
  // LOGIC - Data (List of Maps)
var goals = [
    {
      'subject': 'Mobile App Development',
      'hours': 3,
      'done': false,
    },
    {
      'subject': 'Cloud Computing',
      'hours': 2,
      'done': false,
    },
    {
      'subject': 'Mobile Communication',
      'hours': 4,
      'done': false,
    },
  ];

  // LOGIC - Add a sample goal
  void addSampleGoal() {
    setState(() {
      goals.add({
        'subject': 'New Study Subject',
        'hours': 2,
        'done': false,
      });
    });
  }

  // LOGIC - Toggle goal done status
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !(goals[index]['done'] as bool);
    });
  }

  // LOGIC - Delete a goal
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

  // LOGIC - Update goal status
  void updateGoalStatus(int index, bool value) {
    setState(() {
      goals[index]['done'] = value;
    });
  }

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
          children: [
            // STATIC - Heading
            const Text(
              'My Study Goals',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // CONNECTION - Display goals using ListView.builder
            Expanded(
              child: goals.isEmpty
                  ? const Center(
                      child: Text('No study goals yet.'),
                    )
                  : ListView.builder(
                      itemCount: goals.length,
                      itemBuilder: (context, index) {
                        final goal = goals[index];
                        final String subject = goal['subject'] as String;
                        final int hours = goal['hours'] as int;
                        final bool isDone = goal['done'] as bool;

                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: isDone,
                              onChanged: (value) {
                                if (value != null) {
                                  updateGoalStatus(index, value);
                                }
                              },
                            ),
                            title: Text(
                              subject,
                              style: TextStyle(
                                decoration: isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Text('$hours hours'),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deleteGoal(index);
                              },
                            ),
                            onTap: () {
                              toggleGoal(index);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // CONNECTION - Add goal button
      floatingActionButton: FloatingActionButton(
        onPressed: addSampleGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}