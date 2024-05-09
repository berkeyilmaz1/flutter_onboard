import 'package:auth_with_onboarding/feature/onboard/model/onboard_model.dart';
import 'package:flutter/material.dart';

class OnboardCard extends StatelessWidget {
  const OnboardCard({super.key, required this.model});
  final OnboardModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(model.description),
        Image.asset(model.imagePath),
      ],
    );
  }
}
