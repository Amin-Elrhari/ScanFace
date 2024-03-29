import 'package:flutter/material.dart';
import 'package:scanfaceapp/tt.dart';
import 'FaceRecognitionScreen.dart';
import 'SplashScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScanFace',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:SplashScreen(),
      routes: {
        '/home': (context) => SplashScreen(),
        '/rtrt': (context) => FaceRecognitionScreen(),
        '/tt': (context) => tt(),
      },
    );
  }
}
