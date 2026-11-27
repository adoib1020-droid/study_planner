import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: StudyPlanner()));
class StudyPlanner extends StatefulWidget {
  const StudyPlanner({super.key});
  @override
  State<StudyPlanner> createState() => _StudyPlannerState();
}
class _StudyPlannerState extends State<StudyPlanner> {
  // LOGIC
  List goals = [
    {'subject': 'Mobile App Development', 'hours': 3, 'done': false},
    {'subject': 'Cloud Computing', 'hours': 2, 'done': false},
    {'subject': 'Mobile Communication', 'hours': 2, 'done': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: const Text('My Study Planner'),
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
),
      // CONNECTION
      body: ListView.builder(
        itemCount: goals.length,
        itemBuilder: (context, i) {
          return CheckboxListTile(
            value: goals[i]['done'],
            title: Text(
              goals[i]['subject'],
              style: TextStyle(
                decoration: goals[i]['done'] ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text('${goals[i]['hours']} hours'),
            secondary: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => setState(() => goals.removeAt(i)),
            ),
            onChanged: (v) => setState(() => goals[i]['done'] = v),
          );
        },
      ),
      // CONNECTION
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(
          () => goals.add({'subject': 'New Subject', 'hours': 2, 'done': false}),
        ),
      ),
    );
  }
}