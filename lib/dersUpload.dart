import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class UploadLessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Ders Yükleme'),
        ),
        body: UploadLessonForm(),
      ),
    );
  }
}

class UploadLessonForm extends StatefulWidget {
  @override
  _UploadLessonFormState createState() => _UploadLessonFormState();
}

class _UploadLessonFormState extends State<UploadLessonForm> {
  String selectedFilePath = '';

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFilePath = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: pickPDF,
            child: Text('PDF Seç'),
          ),
          SizedBox(height: 16),
          selectedFilePath.isNotEmpty
              ? Text(
            'Seçilen PDF: $selectedFilePath',
            style: TextStyle(fontSize: 18),
          )
              : Container(),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadLessonPage(),
    );
  }
}
