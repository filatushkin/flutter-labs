import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tapah/widgets/task/task_card.dart';

import '../../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> transactions;

  TaskList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TaskCard(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}
