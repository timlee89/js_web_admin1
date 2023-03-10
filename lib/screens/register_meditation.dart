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
      //*** ???????????? ????????? ???????????? url??? firestore??? ??????
      //*** Firestore??? ??? ????????? field??? ???????????? ?????????...
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
              "?????? ????????? ?????? ??????",
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
                hintText: "??????",
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
                hintText: "???????????? ?????? ID",
              ),
            ),
          ),
          //***  Radio button?????? ??????: true, false ?????? ??????
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              " isFree: Radio button?????? ??????: true, false ?????? ??????",
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
                hintText: "?????? ?????? (True or False)",
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
                hintText: "????????? ????????? ????????? ????????? ??????",
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
                hintText: "?????? ????????? ??????",
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
                hintText: "??????(,)??? ???????????? ????????? ????????? ????????? ???????????????",
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
                hintText: "?????? ?????? (??????: #FFFFFF)",
              ),
            ),
          ),
          //***  Radio button?????? ??????: audio ?????? video ??????
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "File Format: Radio button?????? ??????: audio ?????? video ??????",
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
          // ????????? ?????? ????????? ?????? ??????
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                const Text(
                  "Audio/Video ??????",
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
                    "???????????? ????????????",
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
              // ????????? ????????? ??????
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "????????? ?????????",
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
              //*** ??????????????? ????????? lockscreen thumbnail ????????? ??????
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "???????????? ????????? ?????????",
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
              // play????????? full image ????????? ??????
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      "Play?????? ???????????????",
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
                  //*** 1. ???????????? ?????? ????????? ?????? ?????? Firestore??? ??????
                  //*** 2. ?????????: ????????? view??? ????????????
                  //*** 3. ????????? ????????????, ?????? indicator??? ???????????? 2??? ?????? ????????? ??? ????????? ??????,
                  //*** 4. ???????????? ????????? ????????? ???????????? (List Meditations ???????????? ??????)
                  //*** ???, ?????? ???????????? null??? ???????????? ??????, ?????? ????????? ??????????????? ???
                  //*** ???????????? ?????? ????????? ???????????? ????????? error message ???
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // ?????? ??????
                  backgroundColor: Colors.redAccent, // ??????
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                child: const Text(
                  "?????? ????????? Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {
                  //***
                  //*** ???????????? ?????? ????????? ????????????, List ???????????? ????????????
                  //***
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // ?????? ??????
                  backgroundColor: Colors.grey, // ??????
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
              "//1. Register ????????? ????????????, ?????? indicator??? ???????????? 2??? ?????? ????????? ??? ????????? ??????,\n ????????? ?????? ????????? firebase??? ??????????????? \n ???????????? ????????? List Meditations ???????????? ??????  \n //*** ???, ?????? ???????????? null??? ???????????? ??????, ?????? ????????? ??????????????? ???\n //*** ???????????? ?????? ????????? ???????????? ????????? error message ??? \n 2. Reset ????????? ????????????, ???????????? ?????? ????????? ?????? ???????????? \n \n idName??? ????????? ?????? ?????? DB??? ????????? ???????????? ?????? ?????? ????????? ????????????",
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
