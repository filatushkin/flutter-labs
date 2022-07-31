import 'package:flutter/material.dart';
import 'package:tapah/models/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  // ignore: use_key_in_widget_constructors
  const TaskCard(this.task);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.blueGrey[100],
      child: Row(
        children: <Widget>[
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              checkColor: Colors.white,
              shape: CircleBorder(),
              fillColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return Theme.of(context).primaryColor;
              }),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                  print(isChecked);
                });
              },
            ),
          ),
          Icon(Icons.arrow_drop_up),
          Flexible(
            child: Text(
              widget.task.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: (isChecked == true ? Colors.grey : Colors.black),
                decoration: (isChecked == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
