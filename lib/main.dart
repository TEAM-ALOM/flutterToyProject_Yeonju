import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent.shade100),
        useMaterial3: true,
      ),
      home:const Home(title:'To Do List'),
    );
    }
  }


class Home extends StatefulWidget{
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home>{
  /*int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
*/
  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.calendar_today_sharp,
        size: 30,),
      title: const Text("To Do List",
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w700,
      ),
      ),
        actions: [
          IconButton(icon: const Icon(
            Icons.add,
            size: 30,
          ),onPressed:(){},
          )
        ], // actions
      ),
      body: const Column(
        children: [
          ExpansionTile(title: Text("오늘의 할 일",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
          ),
      ),
          ExpansionTile(title: Text("일주일 간 해야 할 일",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),),),
          ExpansionTile(title: Text(
            "이번 달의 할 일",
            style: TextStyle(
              fontSize: 20,
            ),
          ),),
          ExpansionTile(title: Text(
            "지금 할 일",
            style: TextStyle(
              fontSize: 20,
            ),
          ),),
          ExpansionTile(title: Text(
            "오늘의 할 일",
            style: TextStyle(
              fontSize: 20,
            ),
          ),),
        ],
      ),
    );

  }

}