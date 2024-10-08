import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  bool isDone=false ;

  TaskModel({
    required this.isDone,
    required this.title,
    required this.content,
  });
}
