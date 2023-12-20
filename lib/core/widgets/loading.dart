import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: SizedBox(
            height: 70,
            width: 70,
            child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}