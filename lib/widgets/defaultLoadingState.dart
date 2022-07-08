import 'package:flutter/material.dart';

class HomeScreenLoadingState extends StatelessWidget {
  const HomeScreenLoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.longestSide * 0.1),
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}
