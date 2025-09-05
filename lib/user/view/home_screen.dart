import 'package:flutter/material.dart';
import 'package:koin/common/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}