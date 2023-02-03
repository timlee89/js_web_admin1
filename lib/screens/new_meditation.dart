import 'dart:io';
import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:js_web_admin1/model/param.dart';
import 'package:js_web_admin1/services/firebase_services.dart';

class NewMeditation extends StatelessWidget {
  static const String id = "new-meditation";
  NewMeditation({Key? key}) : super(key: key);

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
      // String downloadUrl = await meditationsRef.getDownloadURL().then((value) {
      //   //save download url link to firestore
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
            padding: EdgeInsets.all(10.0),
            child: Text(
              "명상 컨텐츠 신규 추가",
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
            child: TextField(
              controller: title,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
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
              controller: fileFormat,
              style: TextStyle(fontSize: Param.inputBox1Font),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "File Format",
                hintText: "audio or video",
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
          // Padding(
          //     padding: const EdgeInsets.symmetric(
          //         horizontal: Param.inputBox1H, vertical: Param.inputBox1V),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         RadioListTile(
          //           title: Text("audio"),
          //           value: "audio",
          //           groupValue: fileFormat,
          //           onChanged: (value) {
          //             setState(() {
          //               fileFormat = value.toString();
          //             });
          //           },
          //         ),
          //         RadioListTile(
          //           title: Text("video"),
          //           value: "video",
          //           groupValue: fileFormat,
          //           onChanged: (value) {
          //             setState(() {
          //               fileFormat = value.toString();
          //             });
          //           },
          //         ),
          //       ],
          //     )),

          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Column(
                children: [
                  const Text(
                    "썸네일 이미지",
                    style: TextStyle(fontSize: 14, color: Colors.lightBlue),
                  ),
                  SizedBox(
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
                        pickImage();
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
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      uploadFileToStorage();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // 내부 글자
                      backgroundColor: Colors.blue, // 배경
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    child: const Text(
                      "Upload",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                children: [
                  const Text(
                    "Play화면 배경이미지",
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
                        pickImage();
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      uploadFileToStorage();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // 내부 글자
                      backgroundColor: Colors.blue, // 배경
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    child: const Text(
                      "Upload",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
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
                        pickImage();
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      uploadFileToStorage();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // 내부 글자
                      backgroundColor: Colors.blue, // 배경
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    child: const Text(
                      "Upload",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                children: [
                  const Text(
                    "Audio/Video 파일",
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      uploadFileToStorage();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // 내부 글자
                      backgroundColor: Colors.blue, // 배경
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    child: const Text(
                      "Upload",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // 내부 글자
                  backgroundColor: Colors.redAccent, // 배경
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: TextStyle(fontSize: 15),
                ),
                child: const Text(
                  "Upload",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // 내부 글자
                  backgroundColor: Colors.grey, // 배경
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: TextStyle(fontSize: 15),
                ),
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class TextInputBox extends StatefulWidget {
  final String labelText;
  final String hintText;

  const TextInputBox(
      {Key? key, required this.labelText, required this.hintText})
      : super(key: key);

  @override
  State<TextInputBox> createState() => TextInputBoxState();
}

class TextInputBoxState extends State<TextInputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: TextField(
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
      ),
    );
  }
}

// Form(
// key: _formKey,
// child: Column(
// children: [
// const Text("Add Category", style: TextStyle(color: Colors.blue, fontSize: 30),),
// Row(
// children: [
// Container(
// height: 200,
// width: 200,
// decoration: BoxDecoration(
// color: Colors.blueGrey,
// borderRadius: BorderRadius.circular(8),
// border: Border.all(color: Colors.blue, width: 2),
// ),
// ),
// const SizedBox(width: 10,),
// Column(
// children: [
// Container(
// width: 200,
// child: TextFormField(
// controller: _catName,
// validator: (value){
// if(value!.isNotEmpty){
// return "Enter Category Name";
// }
// return null;
// },
// decoration: const InputDecoration(
// label: Text("Enter Category Name"),
// contentPadding: EdgeInsets.zero
// ),
// )
// ),
// Row(
// children: [
// TextButton(onPressed: (){}, child: Text("Save")),
// TextButton(onPressed: (){}, child: Text("Save")),
// ],
// )
//
// ],
// )
// ],
// )
// ],
// ),
// );
