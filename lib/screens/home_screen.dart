import 'package:eos_todolist/widgets/add_button.dart';
import 'package:eos_todolist/widgets/todo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDoLists = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toDoLists.add("11111111");
    toDoLists.add("22222222");
    toDoLists.add("33333333");
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA4C639).withOpacity(0.1),
        centerTitle: false,
        title: const Text('EOS ToDoList'),
        leading: Image.asset('assets/images/eos_logo.png'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 10, color: Colors.grey),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/eos_logo.png'),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '김무현',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('2학기 성적 장학금 받기'),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                      color: const Color(0xFFA4C639).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Positioned(
                top: 20,
                left: MediaQuery.of(context).size.width / 2 - 75,
                child: Container(
                  width: 150,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA4C639).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "To do list",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 40, right: 25),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 420,
                  child: ListView.builder(
                    itemCount: toDoLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoItem(
                        title: toDoLists[index],
                        onDelete: () {
                          setState(() {
                            toDoLists.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 50,
                child: AddButton(onPressed: _showAddToDoDialog),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showAddToDoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('할 일 추가'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: "할 일을 입력하세요",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    toDoLists.add(_textController.text);
                    _textController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("추가"),
            ),
          ],
        );
      },
    );
  }
}
