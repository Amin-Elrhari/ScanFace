import 'package:flutter/material.dart';

import 'FaceRecognitionScreen.dart';
class tt extends StatefulWidget {
  @override
  _ttState createState() => _ttState();
}

class _ttState extends State<tt> {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    home(),
    Page2(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
            bottom: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
            backgroundColor: Colors.blue.shade700,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade400,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.document_scanner_outlined),
                label: 'Scanner',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  Navigator.pushNamed(context, '/list');
                }
              },
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  Navigator.pushNamed(context, '/list');
                }
              },
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/image5.jpg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'This is going to be a login page',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue.shade700
                ),
              ),
            ),



            Container(
              margin: EdgeInsets.only(top: 160.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10.0),
                  Text(
                    'Please scroll to the right',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.blue.shade700,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FaceRecognitionScreen(),
    );
  }
}
