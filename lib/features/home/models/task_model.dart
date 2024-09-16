import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;

  TaskModel({required this.title, required this.content});

  // static List<TaskModel> demo = [
  //   TaskModel(title: "Marudk", content: "flutterManuhnj"),
  //   TaskModel(title: "Marudk", content: "flutterManuhnj"),
  //   TaskModel(title: "Marudk", content: "flutterManuhnj"),
  //   TaskModel(title: "Marudk", content: "flutterManuhnj"),
  // ];
}
