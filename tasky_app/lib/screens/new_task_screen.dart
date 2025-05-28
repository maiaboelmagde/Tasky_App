import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text('Task Name ', style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Finish UI design for login screen',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Task Description ', style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
              ),
            ),
            Spacer(flex: 1,),
            Container(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: Text('Add Task')))
        
          ],
        ),
      ),
    );
  }
}
