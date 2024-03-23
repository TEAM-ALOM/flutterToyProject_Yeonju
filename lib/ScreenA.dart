import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "취소",
          ),
        ),
        title: const Text(
          "오늘의 할 일은 무엇인가요?",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            child: Text("확인"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ], // actions
      ),
      body: TodoInput(),
    );
  }
}

class TodoInput extends StatefulWidget {
  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: '할 일',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // 입력된 할 일을 처리하는 로직을 여기에 추가하세요
            String todo = _textEditingController.text;
            print('입력된 할 일: $todo');
            // 예를 들어, 여기에서는 입력된 할 일을 출력합니다.
          },
          child: Text('추가'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
