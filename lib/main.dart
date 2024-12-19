import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // 앱 실행 시작점
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메모 앱', // 앱 제목
      theme: ThemeData(primarySwatch: Colors.blue), // 앱의 기본 테마 색상
      home: MemoApp(), // 시작 페이지 설정
    );
  }
}

class MemoApp extends StatefulWidget {
  @override
  _MemoAppState createState() => _MemoAppState(); // State를 사용하여 동적인 UI 구현
}

class _MemoAppState extends State<MemoApp> {
  List<String> memos = []; // 메모를 저장할 리스트
  final TextEditingController _controller =
      TextEditingController(); // 텍스트 입력 필드 컨트롤러

  // 메모를 추가하는 함수
  void _addMemo() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        // 텍스트 필드가 비어있지 않은 경우
        memos.add(_controller.text); // 메모 리스트에 입력값 추가
        _controller.clear(); // 입력 필드 초기화
      }
    });
  }

  // 메모를 삭제하는 함수
  void _deleteMemo(int index) {
    setState(() {
      memos.removeAt(index); // 특정 인덱스의 메모 삭제
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 앱'), // 상단 앱바에 표시될 제목
      ),
      body: Column(
        children: [
          // 입력 필드와 추가 버튼
          Padding(
            padding: const EdgeInsets.all(16.0), // 상하좌우 여백 16
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller, // 텍스트 필드 컨트롤러 연결
                    decoration: InputDecoration(
                      hintText: '메모를 입력하세요', // 입력 필드 힌트 텍스트
                      border: OutlineInputBorder(), // 입력 필드 테두리 스타일
                    ),
                  ),
                ),
                SizedBox(width: 8), // 텍스트 필드와 버튼 사이 간격
                ElevatedButton(
                  onPressed: _addMemo, // 버튼 클릭 시 메모 추가
                  child: Text('추가'),
                ),
              ],
            ),
          ),
          // 메모 리스트 표시
          Expanded(
            child: ListView.builder(
              itemCount: memos.length, // 메모의 개수만큼 리스트 생성
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(memos[index]), // 메모 텍스트 표시
                    trailing: IconButton(
                      icon: Icon(Icons.delete), // 삭제 아이콘
                      onPressed: () => _deleteMemo(index), // 아이콘 클릭 시 메모 삭제
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
/*_addMemo 함수: 텍스트 필드에 입력된 내용을 리스트에 추가하는 기능.
_deleteMemo 함수: 특정 메모를 삭제하는 기능.
TextEditingController: 텍스트 필드의 입력값을 관리하기 위해 사용.
ListView.builder: 리스트를 효율적으로 렌더링하는 위젯으로, 많은 데이터를 표시할 때 유용.
setState: 메모 추가/삭제 시 UI를 업데이트하는 역할. */