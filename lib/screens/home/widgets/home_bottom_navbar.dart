import 'package:flutter/material.dart';
import 'package:machine_test/screens/result/result_screen.dart';
import 'package:machine_test/screens/saved/saved_screen.dart';
import 'package:machine_test/utils/common_colors.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
    required this.start,
    required this.end,
  });
  final String start;
  final String end;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return ResultScreen(
                  start: start.isEmpty ? "Ernakulam" : start,
                  end: end.isEmpty ? "Tripunithura" : end,
                );
              }));
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Center(
                child: Text(
                  'Navigate',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const SavedScreen();
              }));
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Center(
                child: Text(
                  'Saved',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
