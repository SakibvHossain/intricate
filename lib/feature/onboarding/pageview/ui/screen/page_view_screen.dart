import 'package:flutter/material.dart';
import 'package:intricate1/feature/onboarding/onboarding_1/ui/screen/onboarding_1.dart';
import 'package:intricate1/feature/onboarding/onboarding_2/ui/screen/onboarding_2.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  // Create a PageController to control the PageView
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [Onboarding1(), Onboarding2()],
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          // Page Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0),
                _buildDot(1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build a dot indicator for the page
  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.green : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
