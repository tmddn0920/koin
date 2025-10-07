import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/user/views/auth/widgets/dropdown_field.dart';
import 'package:koin/user/views/auth/views/signup_category_selection_screen.dart';

class SignUpInfoScreen extends StatefulWidget {
  const SignUpInfoScreen({super.key});

  @override
  State<SignUpInfoScreen> createState() => _SignUpInfoScreenState();
}

class _SignUpInfoScreenState extends State<SignUpInfoScreen> {
  String? _selectedNationality;
  String? _selectedLanguage;
  String? _selectedResidenceType;
  String? _selectedResidencePeriod;

  final List<String> _nationalities = [
    'China',
    'Japan',
    'Taiwan',
    'USA',
    'Vietnam',
    'Philippines',
    'Hong Kong',
    'Thailand',
    'Malaysia',
  ];
  final List<String> _languages = [
    'English',
    'Chinese',
    'Japanese',
    'Cantonese (Hong Kong)',
    'Taiwanese',
    'Vietnamese',
    'Thai',
    'Malay',
  ];
  final List<String> _residenceTypes = [
    'Exchange Student',
    'Working Holiday',
    'Tourist',
    'Resident',
  ];
  final List<String> _residencePeriods = [
    '1 Month',
    '3 Months',
    '6 Months',
    '1 Year',
    'More than 1 Year',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: TRANSPARENT_COLOR,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: BLACK_COLOR),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [GRADIENT_COLOR, WHITE_COLOR],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.4],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                '코인을 더욱 유용하게 사용하기 위해',
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: BLACK_COLOR),
              ),
              const SizedBox(height: 5),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                        text: '방문 정보', style: TextStyle(color: PRIMARY_COLOR)),
                    TextSpan(
                        text: '를 알려주세요.', style: TextStyle(color: BLACK_COLOR)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              DropdownField(
                label: 'Nationality',
                value: _selectedNationality,
                items: _nationalities,
                onChanged: (newValue) {
                  setState(() => _selectedNationality = newValue);
                },
              ),
              const SizedBox(height: 30),
              DropdownField(
                label: 'Language',
                value: _selectedLanguage,
                items: _languages,
                onChanged: (newValue) {
                  setState(() => _selectedLanguage = newValue);
                },
              ),
              const SizedBox(height: 30),
              DropdownField(
                label: 'Residence type',
                value: _selectedResidenceType,
                items: _residenceTypes,
                onChanged: (newValue) {
                  setState(() => _selectedResidenceType = newValue);
                },
              ),
              const SizedBox(height: 30),
              DropdownField(
                label: 'Residence Period',
                value: _selectedResidencePeriod,
                items: _residencePeriods,
                onChanged: (newValue) {
                  setState(() => _selectedResidencePeriod = newValue);
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedNationality == null ||
                        _selectedLanguage == null ||
                        _selectedResidenceType == null ||
                        _selectedResidencePeriod == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('모든 방문 정보를 선택해주세요.')),
                      );
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CategorySelectionScreen(
                          selectedNationality: _selectedNationality!,
                          selectedLanguage: _selectedLanguage!,
                          selectedResidenceType: _selectedResidenceType!,
                          selectedResidencePeriod: _selectedResidencePeriod!,
                        ),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


