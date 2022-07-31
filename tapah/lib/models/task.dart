import 'package:uuid/uuid.dart';

//Task Model
class Task {
  final String id;
  final String title;
  //final double amount;
  //final DateTime date;
  
  String? description;
  DateTime? duedate;
  DateTime? notify;
  TaskPriority? priority;
  TaskStatus? status;
  

  //potential future
  int? estimatedTime;
  int? usedTime;

  Task({
    required this.title,
    //required this.amount,
    //required this.date,
    this.description,
    this.notify,
    this.duedate,
    this.priority,
    this.status
  }) : id =  const Uuid().v4();
}

//Task Priority
enum TaskPriority { blocker, critical, major, highest, high, medium, low, lowest, minor, trivial}

//Task Statuses
enum TaskStatus { open, inprogress, intesting, inreview, done, closed, failed, rejected, inplanning, awaiting }
