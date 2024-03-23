import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:hive/hive.dart';

class ScreenA extends StatefulWidget {
  @override
  _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  DateTime? _selectedDate;
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? newStartTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (newStartTime != null) {
      setState(() {
        _startTime = newStartTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? newEndTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (newEndTime != null) {
      setState(() {
        _endTime = newEndTime;
      });
    }
  }

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
        ],
      ),
      backgroundColor: Colors.deepPurpleAccent.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "할 일",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
              TextFormField(
                onSaved: (val) {},
                validator: (val) {
                  if (val!.isEmpty) {
                    return '할 일을 적어주세요!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "날짜",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _selectedDate != null
                        ? "${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}" // 선택한 날짜를 "yyyy/mm/dd" 형식으로 변환
                        : "",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black, // 검정색으로 설정
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                      ).then(
                            (selectedDate) {
                          if (selectedDate != null) {
                            setState(() {
                              _selectedDate = selectedDate;
                            });
                          }
                        },
                      );
                    },
                    child: const Text("날짜 선택"),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "시간",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200
                ),
              ),
          SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 시작 시간과 종료 시간을 중앙에 정렬하고 사이에 공간을 균등하게 배분
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '시작 시간',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _selectStartTime(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${_startTime.hour}:${_startTime.minute.toString().padLeft(2, '0')}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20), // 시작 시간과 종료 시간 사이에 공백 추가
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '종료 시간',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _selectEndTime(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "${_endTime.hour}:${_endTime.minute.toString().padLeft(2, '0')}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50), // 간격 추가
                  const Text(
                    "메모",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(height: 10), // 간격 추가
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10), // 정사각형으로 만들기 위해 BorderRadius.circular로 값을 같게 설정
                    ),
                    child: TextFormField(
                      maxLines: 5, // 다수의 줄을 작성할 수 있는 입력창으로 설정
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '메모를 입력하세요', // 사용자에게 힌트를 제공
                      ),
                    ),
                  ),
                ],
              ),

            ],
              ),
          ),
        ),
    );
  }
}