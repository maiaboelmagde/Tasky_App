import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/core/components/custom_text_form_field.dart';
import 'package:tasky_app/core/controllers/tasks_controller.dart';
import 'package:tasky_app/models/task_model.dart';

class EditTaskComponent extends StatefulWidget {
  const EditTaskComponent({super.key, required this.myTask});

  final TaskModel myTask;

  @override
  State<EditTaskComponent> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskComponent> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  late bool isHighPriority;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.myTask.taskTitle);
    _descController = TextEditingController(
      text: widget.myTask.taskDescription,
    );
    isHighPriority = widget.myTask.isHighPriority;
  }

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: FractionallySizedBox(
        heightFactor: 0.75,
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 650,
              child: ListView(
                children: [
                  CustomTextFormField(
                    title: 'Task Name',
                    hintText: 'Write task name here...',
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You must enter a task title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    title: 'Task Description',
                    hintText:
                        'Finish onboarding UI and hand off to devs by Thursday.',
                    controller: _descController,
                    maxLines: 7,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'High Priority',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const Spacer(),
                      Switch(
                        value: isHighPriority,
                        onChanged: (value) {
                          setState(() {
                            isHighPriority = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          tasksProvider.editTask(
                            taskId: widget.myTask.id,
                            taskTitle: _titleController.text,
                            taskDescription: _descController.text,
                            isHighPriority: isHighPriority,
                          );
                          Navigator.pop(context);
                        }
                      },
                      label: const Text('Save Changes'),
                      icon: const Icon(Icons.edit),
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
