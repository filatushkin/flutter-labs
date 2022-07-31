import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './widgets/task/new_task.dart';
import './widgets/task/task_list.dart';
import './models/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedTabIndex = 0;

  final List<Task> _userTransactions = [
    Task(
      title: 'Task 1',
      duedate: DateTime.now(),
    ),
    Task(
      title: 'Task 2',
      duedate: DateTime.now(),
    ),
  ];
  
  List<Widget> _widgetOptions = [];
  

  void _onTabItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  

  void _addNewTransaction(String txTitle) {
    final newTx = Task(
      title: txTitle,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTask(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    _widgetOptions = <Widget>[
      SingleChildScrollView(
          child: TaskList(_userTransactions),
      ),
      Text(
        'Index 1: Business',
      ),
      Text(
        'Index 2: School',
      ),
      Text(
        'Index 3: School',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () => _startAddNewTransaction(context),
          // ),
          IconButton(
            icon: Icon(Icons.table_rows_rounded),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Regular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Team',
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.archive),
             label: 'Archive',
          ),
          
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: Colors.amber[800],
        //backgroundColor: Colors.black,
        enableFeedback: true,
        showUnselectedLabels: true,
        //unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        onTap: _onTabItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedTabIndex),
      // body: SingleChildScrollView(
      //   child: Column(
      //     // mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Container(
      //         width: double.infinity,
      //         child: Card(
      //           color: Colors.blue,
      //           child: Text('CHART!'),
      //           elevation: 5,
      //         ),
      //       ),
      //       TaskList(_userTransactions),
      //     ],
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        enableFeedback: true,
      ),
    );
  }
}
