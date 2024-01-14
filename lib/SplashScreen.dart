

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:scanfaceapp/tt.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward().whenComplete(() {
      Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return tt();
        })),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade200],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: _animation.value * 250,
                  height: _animation.value * 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30, // Replace with desired color
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.png',
                      width: _animation.value * 200,
                      height: _animation.value * 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  "ScanFace",
                  style: TextStyle(
                    color: Colors.lightBlue.shade900,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
