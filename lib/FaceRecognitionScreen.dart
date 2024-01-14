
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanfaceapp/tt.dart';




class FaceRecognitionScreen extends StatefulWidget {
  const FaceRecognitionScreen({Key? key}) : super(key: key);

  @override
  State<FaceRecognitionScreen> createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {

  late  int id;
  File? _image;
  List<Face>faces =[];
  bool variable =false;

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

      variable=true;
      id=faces.length;
      MaterialPageRoute(
        builder: (context) => Page2(),
      );

    });
    print(faces.length);
  }

  List<String> names = [];
  List<String> names1 = [
    'Mohamed elghari',
  ];

  List<String> names2 = [
    'Mohamed elghari',
    'Mohammed ocheker',
  ];

  List<String> names3 = [
    'Mohamed elghari',
    'Mohammed ocheker',
    'Oussama Zakkane',
  ];

  List<String> names4 = [
    'Mohammed ocheker',
    'Oussama Zakkane',
  ];

  List<String> names5 = [
    'Oussama Zakkane',
  ];

  List<String> names6 = [
    'aucun absence',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade200,  // Couleur de fond
            borderRadius: BorderRadius.circular(10.0),  // Rayon arrondi
          ),
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: 1400,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),

                child:  Center(
                  child: _image==null?
                  Icon(
                    Icons.add_a_photo,
                    size: 40,
                  ):Image.file(_image!),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: 900,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade500,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera).then((value) {
                      if (_image != null) {
                        _detectFaces(_image!);
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Scanes Faces",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: 900,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade500,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera).then((value) {
                      if (_image != null) {
                        _detectFaces(_image!);
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align children in the center
                    children: [
                      Icon(
                        Icons.file_upload_outlined, // Replace with the desired icon
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "import",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  SizedBox(height: 15,),
                  Text(
                    "Le nombre des Stagaire est : ${faces.length}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

/////:: list
              SingleChildScrollView(
                child:Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xAD90C592),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.all(10.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: faces.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    decoration: BoxDecoration(
                                      color: Color(0x4C68AF50),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ListTile(
                                      title: faces.length == 1
                                          ? Text(
                                        "Mohamed el rhari",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1E4107),
                                        ),
                                      )
                                          : faces.length == 2
                                          ? index == 0
                                          ? Text(
                                        "Mohamed el rhari",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1E4107),
                                        ),
                                      )
                                          : Text(
                                        "Mohamed Ocheker",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1E4107),
                                        ),
                                      )
                                          : index == 0
                                          ? Text(
                                        "Mohamed el rhari",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1E4107),
                                        ),
                                      )
                                          : index == 1
                                          ? Text(
                                        "Mohamed Ocheker",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1E4107),
                                        ),
                                      )
                                          : Text(
                                        "Oussama Zakkane",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF1E4107),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )


                          ),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x9BD0A3A3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.all(10.0),
                            child: ListView.builder(

                              shrinkWrap: true,
                              itemCount:faces.length,
                              itemBuilder: (context, index){
                                return Container(
                                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10) ,
                                  decoration: BoxDecoration(
                                    color:Color(0xBEB96E6A) ,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child:ListTile(
                                    // tileColor: index % 2 == 0 ? Colors.grey : Colors.white,  // Couleur de fond du ListTile
                                    /*shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.black, width: 4.0),
                                  ),*/
                                    title: Text(
                                      names2[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        //color: index % 2 == 0 ? Colors.green : Colors.green,  // Couleur du texte
                                        color:Color(0xFF6E0E0A),  // Couleur du texte
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),



////// hadchi ktbo lbar7 ochigarr

              variable?
              Container(
                  child:SingleChildScrollView(child: Row(
                    children: [
                      (

                          Column(children: [

                            Text('Mohammed Ocheker'),
                            SizedBox(height: 5,),
                            Text('Mohammed Ocheker'),
                            SizedBox(height: 5,),
                            Text('Mohammed Ocheker'),




                          ],
                          )


                      ),

                      SizedBox(width: 10,),

                      Column(children: [

                        Text('Mohammed Ocheker'),
                        SizedBox(height: 5,),
                        Text('Mohammed Ocheker'),
                        SizedBox(height: 5,),
                        Text('Mohammed Ocheker'),




                      ],
                      )
                    ],
                  )
                  )
              )
                  :Text('')


            ],
          ),
        ),
      ),
    );
  }
}

