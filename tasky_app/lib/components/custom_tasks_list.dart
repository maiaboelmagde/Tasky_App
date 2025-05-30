import 'package:flutter/material.dart';
import 'package:tasky_app/models/task_model.dart';


class CustomTasksList extends StatelessWidget {
  const CustomTasksList({
    super.key,
    required this.myTasks,
  });

  final List<TaskModel> myTasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myTasks.length,
      itemBuilder: ((context, indx) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.only(right: 12, left: 4),
          decoration: BoxDecoration(
            color: Color.fromRGBO(40, 40, 40, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Spacer(),
              Column(
                children: [
                  Text(
                    myTasks[indx].taskTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    myTasks[indx].taskDescription,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Spacer(),
    
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        );
      }),
    );
  }
}
