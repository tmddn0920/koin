import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white,
      scrolledUnderElevation: 0,
      title: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 48, 
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.30),
            borderRadius: BorderRadius.circular(30), 
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black, 
                    fontFamily: 'Pretendard', 
                    fontSize: 16,
                    fontWeight: FontWeight.w500, 
                    letterSpacing: -0.32,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: '검색어를 입력해주세요.',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.32,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              SvgPicture.asset(
                'asset/img/icon/Search_Black.svg',
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}