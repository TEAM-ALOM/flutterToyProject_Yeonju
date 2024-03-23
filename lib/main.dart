import 'package:flutter/material.dart';
import 'ScreenA.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent.shade100),
        useMaterial3: true,
      ),
      home: const Home(title: 'To Do List'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title});

  final String title;

  @override
  State<Home> createState() => HomePageState();
}

class HomePageState extends State<Home> {
  List<String> currentTasks = [];
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(hours: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.calendar_today_sharp,
          size: 30,
        ),
        title: const Text(
          "To Do List",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ScreenA()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text(
              "오늘의 할 일",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          ExpansionTile(
            title: const Text(
              "일주일 간 해야 할 일",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          ExpansionTile(
            title: const Text(
              "이번 달의 할 일",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ExpansionTile(
            title: const Text(
              "지금 할 일",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            children: currentTasks
                .map((task) => ListTile(
              title: Text(task),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    currentTasks.remove(task);
                  });
                },
              ),
            ))
                .toList(),
          ),
          ExpansionTile(
            title: const Text(
              "오늘의 할 일",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkAndAddTask();
  }

  void checkAndAddTask() {
    DateTime now = DateTime.now();
    if (now.isAfter(startTime) && now.isBefore(endTime)) {
      if (!currentTasks.contains("현재 시간에 할 일")) {
        setState(() {
          currentTasks.add("현재 시간에 할 일");
        });
      }
    } else {
      if (currentTasks.contains("현재 시간에 할 일")) {
        setState(() {
          currentTasks.remove("현재 시간에 할 일");
        });
      }
    }
  }
}
