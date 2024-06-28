import 'package:flutter/material.dart';
import 'package:machine_test/screens/home/widgets/home_bottom_navbar.dart';
import 'package:machine_test/screens/home/widgets/profile_container.dart';
import 'package:machine_test/utils/common_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController start = TextEditingController();
  final TextEditingController end = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: HomeBottomNavBar(
        start: start.text,
        end: end.text,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProfileContainer(),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            height: 205,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: kBlueColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: start,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_pin,
                      color: kGreyColor,
                    ),
                    hintText: 'Start Location',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const Placeholder(
                  fallbackHeight: 105,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            height: 205,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: kBlueColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: end,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_pin,
                      color: kGreyColor,
                    ),
                    hintText: 'End Location',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const Placeholder(
                  fallbackHeight: 105,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
