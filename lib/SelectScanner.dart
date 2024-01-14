
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class FaceRecognitionScreen extends StatefulWidget {
  const FaceRecognitionScreen({Key? key}) : super(key: key);

  @override
  State<FaceRecognitionScreen> createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {
  File? _image;
  List<Face>faces =[];

  Future _pickImage(ImageSource source) async {
    try{
        final image = await ImagePicker().pickImage(source: source);
        if(image == null ) return;
        setState(() {
          _image =File(image.path);
        });
    } catch (e){
      if(kDebugMode){
        print(e);
      }
    }
  }
  Future _detectFaces(File img) async {
    final options = FaceDetectorOptions();
    final facedector = FaceDetector(options: options);
    final inputImage =InputImage.fromFilePath(img.path);
    faces = await facedector.processImage(inputImage);

    setState(() {

    });
    print(faces.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face Detection "),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey,
                  child:  Center(
                    child: _image==null?
                    Icon(
                      Icons.add_a_photo,
                      size: 50,
                    ):Image.file(_image!),
                  ),

                ),
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height:50,

                color: Colors.lightBlue,
                child: MaterialButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera).then((value){
                      if(_image!= null){
                        _detectFaces(_image!);
                      }
                    });
                  },
                  child: Text(
                      "Scanes Faces",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height:50,

                color: Colors.lightBlue,
                child: MaterialButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery).then((value){
                      if(_image!= null){
                        _detectFaces(_image!);
                      }
                    });
                  },
                  child: Text(
                    "Importe and Compare faces",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),

                ),
              ), SizedBox(height: 15,),Text(
                  "The number of people is : ${faces.length}",
              style : TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
              )

            ],
          ),
        ),
      ),
    );
  }
}
