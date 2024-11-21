import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String name = "";
  String shortBio = "";

  Widget _buildListTile({
    required String title,
    required String trailingText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trailingText,
            style: TextStyle(color: Colors.grey),
          ),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }

  void _editName() {
    TextEditingController _nameController = TextEditingController(text: name);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('이름 변경'),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: '김무현'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  name = _nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('취소', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  name = _nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('저장', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _editBio() {
    TextEditingController _bioController = TextEditingController(text: shortBio);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('한줄소개 변경'),
          content: TextField(
            controller: _bioController,
            decoration: InputDecoration(hintText: '2학기 성적 장학금 받기 실패!'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  shortBio = _bioController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('저장', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설정 페이지"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/images/moohyun.png', // 본인 이미지 경로로 수정
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                    title: "이름",
                    trailingText: name,
                    onTap: _editName,
                  ),
                  _buildListTile(
                    title: "한줄소개",
                    trailingText: shortBio,
                    onTap: _editBio,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
