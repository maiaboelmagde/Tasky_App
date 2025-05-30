class TaskModel {
  int id;
  String taskTitle;
  String taskDescription;
  bool isHighPriority;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.taskTitle,
    required this.taskDescription,
    required this.isHighPriority,
    required this.isCompleted
  });

  factory TaskModel.fromMap(Map<String, dynamic> dataMap) {
    return TaskModel(
      id: dataMap['id'],
      taskTitle: dataMap['taskTitle'],
      taskDescription: dataMap['taskDescription'],
      isHighPriority: dataMap['isHighPriority'],
      isCompleted: dataMap['isCompleted']
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $taskTitle, description: $taskDescription, isHighPriority: $isHighPriority, isCompleted: $isCompleted }';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'isHighPriority': isHighPriority,
      'isCompleted':isCompleted
    };
  }
}
