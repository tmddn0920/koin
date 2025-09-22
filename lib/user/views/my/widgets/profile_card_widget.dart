import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x80CEE1FF), 
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: WHITE_COLOR,
                          child: Image.asset(
                            'asset/img/icon/my_screen/People.png',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Koina',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  ClipOval(
                                    child: Image.asset(
                                      'asset/img/icon/CountryIcon_Germany.png',
                                      width: 14,
                                      height: 14,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Exchange student',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF959595),
                                  letterSpacing: -0.24,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Seoul • 6 month',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF959595),
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 1,
                      color: const Color(0xFFCEE1FF),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Image.asset(
                          'asset/img/icon/my_screen/Real.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '실명',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: PRIMARY_COLOR,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF959595),
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x80CEE1FF), 
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: WHITE_COLOR,
                          child: Image.asset(
                            'asset/img/icon/my_screen/Profile.png',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 24),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'K01n',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  letterSpacing: -0.32,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '19',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF959595),
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                  Text(
                                    ' Post',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF959595),
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 1,
                      color: const Color(0xFFCEE1FF),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Image.asset(
                          'asset/img/icon/my_screen/Kommunity.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '코뮤니티',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF6DC59D),
                            letterSpacing: -0.2,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF959595),
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
