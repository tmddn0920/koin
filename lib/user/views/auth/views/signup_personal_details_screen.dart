import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/auth/widgets/page_indicator.dart';
import 'package:koin/user/views/auth/views/signup_security_code_screen.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final String selectedNationality;
  final String selectedLanguage;
  final String selectedResidenceType;
  final String selectedResidencePeriod;
  final Set<String> selectedCategories;
  final Set<String> selectedRegions;
  final Set<String> selectedCultures;

  const PersonalDetailsScreen({
    super.key,
    required this.selectedNationality,
    required this.selectedLanguage,
    required this.selectedResidenceType,
    required this.selectedResidencePeriod,
    required this.selectedCategories,
    required this.selectedRegions,
    required this.selectedCultures,
  });

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  int _currentPage = 0;
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required String label,
    String? hintText,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: PRIMARY_COLOR,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        TextField(
          controller: controller,
          style: const TextStyle(color: BLACK_COLOR, fontSize: 18),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR)),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Sign In',
            style: TextStyle(
                color: WHITE_COLOR, fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildTextField(label: 'First name'),
            _buildTextField(label: 'Surname'),
            _buildTextField(label: 'Birthday', hintText: 'DD/MM/YYYY'),
            _buildTextField(label: 'Gender'),
            _buildTextField(label: 'Email', controller: _emailController),
            const Spacer(),
            const PageIndicator(length: 3, currentIndex: 0),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  final email = _emailController.text;
                  if (email.isEmpty || !email.contains('@')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('올바른 이메일을 입력해주세요.')),
                    );
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecurityCodeScreen(email: email),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  foregroundColor: WHITE_COLOR,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text('Next',
                    style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


