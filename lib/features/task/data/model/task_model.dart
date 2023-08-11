class TaskModel {
  final int? id;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String note;
  final int complete;
  final int color;

  TaskModel({
    this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.note,
    required this.complete,
    required this.color,
  });
  
  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'],
      title: jsonData['title'],
      date: jsonData['date'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      note: jsonData['note'],
      complete: jsonData['complete'],
      color: jsonData['color'],
    );
  }
}
