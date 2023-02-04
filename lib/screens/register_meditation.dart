import 'dart:io';
import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:js_web_admin1/model/param.dart';
import 'package:js_web_admin1/services/firebase_services.dart';

class RegisterMeditation extends StatelessWidget {
  static const String id = "register-meditation";
  RegisterMeditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyCustomForm();
  }
}

//****** Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  FirebaseServices _services = FirebaseServices();

  late final TextEditingController title;
  late final TextEditingController idName;
  late final TextEditingController isFree;
  late final TextEditingController description;
  late final TextEditingController synopsis;
  late final TextEditingController fileFormat;
  late final TextEditingController tags;
  late final TextEditingController themeColor;

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    idName = TextEditingController();
    isFree = TextEditingController();
    description = TextEditingController();
    synopsis = TextEditingController();
    fileFormat = TextEditingController();
    tags = TextEditingController();
    themeColor = TextEditingController();
  }

  @override
  void dispose() {
    title.dispose();
    idName.dispose();
    isFree.dispose();
    description.dispose();
    synopsis.dispose();
    fileFormat.dispose();
    tags.dispose();
    themeColor.dispose();
    super.dispose();
  }

  // static const double paddingHorizontal = 8;
  // static const double paddingVertical = 5;

  dynamic image;
  dynamic thumbnailImage;
  dynamic fullImage;
  dynamic lockThumbnailImage;
  dynamic file;
  late String fileName;

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    } else {
      print("No Image or improper format Selected");
    }
  }

  void pickThumbnailImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        thumbnailImage = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    } else {
      print("No Image or improper format Selected");
    }
  }

  void pickFullImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        fullImage = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    } else {
      print("No Image or improper format Selected");
    }
  }

  void pickLockThumbnailImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        lockThumbnailImage = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    } else {
      print("No Image or improper format Selected");
    }
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'mp4'],
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        file = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    } else {
      print("No File or improper format Selected");
    }
  }

  void uploadFileToStorage() async {
    // Create a storage reference from our app
    final storageRef = firebase_storage.FirebaseStorage.instance.ref();
// Create a reference to "mountains.jpg"
//     final meditationsRef = storageRef.child("meditationAssets/$fileName");
    final meditationsRef = storageRef.child("$fileName");
    try {
      await meditationsRef.putData(image); // upload image to cloud storage
      //*** 업로드한 파일의 다운로드 url을 firestore에 저장
      //*** Firestore에 각 원하는 field에 저장해야 하는데...
      // String imageUrl = await meditationsRef.getDownloadURL().then((value) {
      //   //save image url link to firestore
      // });
    } on firebase_storage.FirebaseException catch (e) {
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
            child: Text(
              "명상 컨텐츠 신규 추가",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: title,
              style: const TextStyle(fontSize: Param.inputBox1Font),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
                hintText: "제목",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: idName,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "idName",
                hintText: "컨텐츠의 고유 ID",
              ),
            ),
          ),
          //***  Radio button으로 변경: true, false 중에 선택
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              " isFree: Radio button으로 변경: true, false 중에 선택",
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: isFree,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "isFree",
                hintText: "유료 여부 (True or False)",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: description,
              style: TextStyle(fontSize: Param.inputBox1Font),
              maxLines: 2,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Description",
                hintText: "썸네일 아래에 보이는 간략한 설명",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: synopsis,
              style: TextStyle(fontSize: Param.inputBox1Font),
              maxLines: 4,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Synopsis",
                hintText: "보다 자세한 설명",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: tags,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Tags",
                hintText: "콤마(,)로 구분하여 태그로 사용할 단어를 나열하세요",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: themeColor,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "themeColor",
                hintText: "테마 칼라 (예시: #FFFFFF)",
              ),
            ),
          ),
          //***  Radio button으로 변경: audio 또는 video 선택
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "File Format: Radio button으로 변경: audio 또는 video 선택",
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: fileFormat,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "File Format",
                hintText: "audio or video",
              ),
            ),
          ),
          // 오디오 또는 비디오 파일 선택
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                const Text(
                  "Audio/Video 파일",
                  style: TextStyle(fontSize: 14, color: Colors.lightBlue),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: InkWell(
                    onTap: () {
                      pickFile();
                    },
                    child: image == null
                        ? const Center(
                            child: Icon(Icons.file_upload),
                          )
                        : Image.memory(
                            image,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    "파일명을 보여준다",
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 썸네일 이미지 선택
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "썸네일 이미지",
                      style: TextStyle(fontSize: 14, color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: InkWell(
                        onTap: () {
                          pickThumbnailImage();
                        },
                        child: thumbnailImage == null
                            ? const Center(
                                child: Icon(Icons.file_upload),
                              )
                            : Image.memory(
                                thumbnailImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              //*** 잠금화면에 사용할 lockscreen thumbnail 이미지 선택
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "잠금화면 썸네일 이미지",
                      style: TextStyle(fontSize: 14, color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: InkWell(
                        onTap: () {
                          pickLockThumbnailImage();
                        },
                        child: lockThumbnailImage == null
                            ? const Center(
                                child: Icon(Icons.file_upload),
                              )
                            : Image.memory(
                                lockThumbnailImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              // play화면의 full image 이미지 선택
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "Play화면 배경이미지",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.lightBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 216,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: InkWell(
                        onTap: () {
                          pickFullImage();
                        },
                        child: fullImage == null
                            ? const Center(
                                child: Icon(Icons.file_upload),
                              )
                            : Image.memory(
                                fullImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  //*** 1. 페이지에 있는 내용을 모두 다시 Firestore에 저장
                  //*** 2. 이미지: 이미지 view를 보여주고
                  //*** 3. 버튼을 클릭하면, 바로 indicator가 나타나서 2번 이상 클릭할 수 없도록 하고,
                  //*** 4. 업로드가 끝나면 페이지 이동한다 (List Meditations 페이지로 이동)
                  //*** 단, 모든 필드값이 null이 아니어야 하고, 모든 파일이 선택되어야 함
                  //*** 하나라도 비어 있거나 파일선택 안되면 error message 뜸
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // 내부 글자
                  backgroundColor: Colors.redAccent, // 배경
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                child: const Text(
                  "신규 컨텐츠 Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {
                  //***
                  //*** 수정하고 있던 내용을 무시하고, List 페이지로 이동한다
                  //***
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // 내부 글자
                  backgroundColor: Colors.grey, // 배경
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "//1. Register 버튼을 클릭하면, 바로 indicator가 나타나서 2번 이상 클릭할 수 없도록 하고,\n 입력한 모든 내용을 firebase에 업로드한다 \n 업로드가 끝나면 List Meditations 페이지로 이동  \n //*** 단, 모든 필드값이 null이 아니어야 하고, 모든 파일이 선택되어야 함\n //*** 하나라도 비어 있거나 파일선택 안되면 error message 뜸 \n 2. Reset 버튼을 클릭하면, 입력하고 있던 내용을 모두 삭제한다 \n \n idName이 동일한 것이 이미 DB에 있다면 진행되지 않고 에러 메시지 알려준다",
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

// class TextInputBox extends StatefulWidget {
//   final String labelText;
//   final String hintText;
//
//   const TextInputBox(
//       {Key? key, required this.labelText, required this.hintText})
//       : super(key: key);
//
//   @override
//   State<TextInputBox> createState() => TextInputBoxState();
// }
//
// class TextInputBoxState extends State<TextInputBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//       child: TextField(
//         autocorrect: false,
//         enableSuggestions: false,
//         style: const TextStyle(fontSize: 14),
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(),
//           hintText: widget.hintText,
//           labelText: widget.labelText,
//         ),
//       ),
//     );
//   }
// }
