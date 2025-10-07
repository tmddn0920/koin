import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/user/views/kommunity/views/board_screen.dart';
import 'package:koin/user/views/kommunity/widgets/kommunity/favorite_boards.dart';
import 'package:koin/user/views/kommunity/widgets/kommunity/realtime_popular_posts.dart';
import 'package:koin/user/views/kommunity/widgets/kommunity/weekly_popular_posts.dart';

class KommunityScreen extends StatefulWidget {
  const KommunityScreen({super.key});

  @override
  State<KommunityScreen> createState() => _KommunityScreenState();
}

class _KommunityScreenState extends State<KommunityScreen> {
  final List<Map<String, dynamic>> _boardCategories = [
    {'name': '자유 게시판', 'icon': Icons.public, 'recent_post': '자유롭게 소통하는 게시판입니다.'},
    {'name': '맛집 게시판', 'icon': Icons.restaurant_outlined, 'recent_post': '나만 아는 노원구 최고의 맛집 공개합니다.'},
    {'name': '여행지 게시판', 'icon': Icons.travel_explore_outlined, 'recent_post': '여수 가볼만한 곳'},
    {'name': '행사 게시판', 'icon': Icons.celebration, 'recent_post': '여의도 불꽃축제합니다!!'},
    {'name': '생활 게시판', 'icon': Icons.home_outlined, 'recent_post': '한국에서 생활 꿀팁 알려드려요.'},
    {'name': '홍보 게시판', 'icon': Icons.campaign_outlined, 'recent_post': '제주도 한달살이 이벤트'},
  ];

  final List<Map<String, dynamic>> _realtimePopularPosts = [
    {
      'title': '한국살이 꿀팁',
      'author': '익명',
      'likes': 211,
      'comments': 32,
      'date': '08/06 20:25',
      'category': '유학/교환학생 게시판',
      'content': '친해지고 싶은 사람 있으면 그냥 밥 한번 사세요...',
    },
    {
      'title': '돈이 없는데 제주도 한달살이...',
      'author': '독일 게시판',
      'likes': 21,
      'comments': 2,
      'date': '08/06 20:26',
      'category': '독일 게시판',
      'content': '돈이 없는데 제주도 한달살이 어떻게 할까요?',
    },
  ];

  final List<Map<String, dynamic>> _weeklyPopularPosts = [
    {'title': 'K-pop 문화가 궁금해요', 'author': '미나', 'likes': 1200, 'comments': 80},
    {'title': '한국어 배우기 좋은 앱 추천', 'author': '존슨', 'likes': 950, 'comments': 55},
    {'title': '서울에서 가볼 만한 숨은 여행지', 'author': '여행가', 'likes': 800, 'comments': 40},
    {'title': '한국 비자 연장 관련 질문', 'author': '루카스', 'likes': 720, 'comments': 30},
    {'title': '외국인 생활정보 공유', 'author': '관리자', 'likes': 680, 'comments': 22},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                _buildSearchField(),
                const SizedBox(height: 24),
                _buildSectionHeader('즐겨찾는 게시판'),
                const SizedBox(height: 12),
                FavoriteBoards(
                  boards: _boardCategories,
                  onTapBoard: (board) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BoardScreen(boardName: board['name']),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _buildSectionHeader('실시간 인기 글 🔥'),
                const SizedBox(height: 12),
                RealtimePopularPosts(posts: _realtimePopularPosts),
                const SizedBox(height: 24),
                _buildSectionHeader('주간 인기 글'),
                const SizedBox(height: 12),
                WeeklyPopularPosts(posts: _weeklyPopularPosts),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: '게시글 검색',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('asset/img/icon/Alarm_Off.svg', width: 24, height: 24),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

