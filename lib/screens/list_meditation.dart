import 'package:flutter/material.dart';
import 'package:js_web_admin1/model/meditation.dart';

class ListMeditation extends StatefulWidget {
  static const String id = "list-meditation";

  const ListMeditation({Key? key}) : super(key: key);

  @override
  State<ListMeditation> createState() => _ListMeditationState();
}

class _ListMeditationState extends State<ListMeditation> {
  List<Sample> samples = [
    Sample(
      title: "아침 명상",
      description: "아침에 하는 명상입니다",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/js-admin-test.appspot.com/o/%E1%84%80%E1%85%A1%E1%86%B7%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%8B%E1%85%B3%E1%86%AF%20%E1%84%83%E1%85%A2%E1%84%92%E1%85%A1%E1%84%82%E1%85%B3%E1%86%AB%20%E1%84%87%E1%85%A5%E1%86%B8-thumbnail.jpg?alt=media&token=39fbe56d-dc22-4296-838f-68a11362b630",
    ),
    Sample(
      title: "저녁 명상",
      description: "저녁에 하는 명상입니다",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/js-admin-test.appspot.com/o/%E1%84%80%E1%85%A1%E1%86%B7%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%8B%E1%85%B3%E1%86%AF%20%E1%84%83%E1%85%A2%E1%84%92%E1%85%A1%E1%84%82%E1%85%B3%E1%86%AB%20%E1%84%87%E1%85%A5%E1%86%B8-thumbnail.jpg?alt=media&token=39fbe56d-dc22-4296-838f-68a11362b630",
    ),
    Sample(
      title: "눈 뜨고 하는 명상",
      description: "눈을 뜨고 하는 명상입니다",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/js-admin-test.appspot.com/o/%E1%84%80%E1%85%A1%E1%86%B7%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%8B%E1%85%B3%E1%86%AF%20%E1%84%83%E1%85%A2%E1%84%92%E1%85%A1%E1%84%82%E1%85%B3%E1%86%AB%20%E1%84%87%E1%85%A5%E1%86%B8-thumbnail.jpg?alt=media&token=39fbe56d-dc22-4296-838f-68a11362b630",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "List of Meditations Content",
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            "(Total: 56)",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            "등록된 개별명상 컨텐츠의 리스트를 gridview 방식으로 보여줌.\n 보여주는 순서는 등록날짜, 제목으로 선택 가능 \n 각 이미지 카드를 선택하면, 그 컨텐츠 내용을 수정할 수 있도록 update meditations 페이지로 이동 ",
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/pic1.png",
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    "아침 명상",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  const Text(
                    "아침에 하는 명상입니다.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/pic1.png",
                    width: 100,
                    height: 100,
                  ),
                  Text("아침 명상"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/pic1.png",
                    width: 100,
                    height: 100,
                  ),
                  Text("아침 명상"),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            "각 이미지카드에 들어갈 내용은... 이미지, 제목, 설명, 등록일, 최종수정일",
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
