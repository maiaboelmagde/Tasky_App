import 'package:flutter/material.dart';
import 'package:tasky_app/components/custom_text_form_field.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isHighPtiority = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 650,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    title: 'Task Name ',
                    hintText: 'Finish UI design for login screen',
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter a task title to add it';
                      }
                      return null;
                    },
                  ),
                        
                  SizedBox(height: 20),
                        
                  CustomTextFormField(
                    title: 'Task Description ',
                    hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
                    controller: _descController,
                    maxLines: 7,
                  ),
                  SizedBox(height: 20),
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
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {

                        }else{
                          _titleController.text = '';
                          _descController.text = '';
                        }
                      },
                      label: Text('Add Task'),
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
