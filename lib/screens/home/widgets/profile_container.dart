import 'package:flutter/material.dart';
import 'package:machine_test/utils/common_colors.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlueColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 100),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Robert Doe",
                    style: TextStyle(
                      color: kWhiteColor,
                    ),
                  ),
                  Text(
                    "robert@gmail.com",
                    style: TextStyle(
                      color: kWhiteColor.withOpacity(.7),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
