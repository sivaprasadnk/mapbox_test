import 'package:flutter/material.dart';
import 'package:machine_test/screens/home/widgets/profile_container.dart';
import 'package:machine_test/utils/common_colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const BottomNavBar(),
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
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: kGreyColor,
                    ),
                    Text(
                      "Trip 1",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Placeholder(
                  fallbackHeight: 145,
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
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: kGreyColor,
                    ),
                    Text(
                      "Trip 2",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Placeholder(
                  fallbackHeight: 145,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlueColor,
      width: double.infinity,
      height: 70,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
                'Go Back',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
