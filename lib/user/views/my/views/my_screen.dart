import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import '../widgets/profile_card_widget.dart';
import '../widgets/action_buttons_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/account_section_widget.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.7212, 1.0],
            colors: [
              Colors.black.withOpacity(0.0), 
              Colors.black.withOpacity(0.05), 
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              ),
              child: Column(
                children: [
                const SizedBox(height: 12),
                const ProfileCardWidget(),
                const SizedBox(height: 20),
                const ActionButtonsWidget(),
                const SizedBox(height: 20),
                const BannerWidget(),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 1,
                  color: GRAY_COLOR,
                ),
                const AccountSectionWidget(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 1,
                  color: GRAY_COLOR,
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


