class TaskModel {
  int id;
  String taskTitle;
  String taskDescription;
  bool isHighPriority;

  TaskModel({
    required this.id,
    required this.taskTitle,
    required this.taskDescription,
    required this.isHighPriority,
  });

  factory TaskModel.fromMap(Map<String, dynamic> dataMap) {
    return TaskModel(
      id: dataMap['id'],
      taskTitle: dataMap['taskTitle'],
      taskDescription: dataMap['taskDescription'],
      isHighPriority: dataMap['isHighPriority'],
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $taskTitle, description: $taskDescription, isHighPriority: $isHighPriority}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'isHighPriority': isHighPriority,
    };
  }
}
