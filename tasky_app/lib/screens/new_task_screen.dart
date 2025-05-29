import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isHighPtiority = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Name ',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Finish UI design for login screen',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Task Description ',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            TextField(
              minLines: 5,
              maxLines: 6,
              decoration: InputDecoration(
                hintText:
                    'Finish onboarding UI and hand off to devs by Thursday.',
              ),
            ),
            Row(
              children: [
                Text(
                  'High Priority ',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Spacer(flex: 1),
                Switch(
                  value: isHighPtiority,
                  onChanged: (value) {
                    setState(() {
                      isHighPtiority = value;
                    });
                  },
                ),
              ],
            ),

            Spacer(flex: 1),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text('Add Task'),
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
