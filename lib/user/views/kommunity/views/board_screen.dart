import 'package:flutter/material.dart';
import 'package:koin/user/views/kommunity/models/post.dart';
import 'package:koin/user/views/kommunity/widgets/board/filter_button.dart';
import 'package:koin/user/views/kommunity/widgets/board/search_header.dart';

class BoardScreen extends StatefulWidget {
  final String boardName;

  const BoardScreen({super.key, required this.boardName});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  String _selectedFilter = '최신순';
  String? _selectedRegion;
  String? _selectedNationality;

  final List<String> _regions = const [
    '서울', '부산', '제주', '인천', '경기', '강원', '충청', '전라', '경상', '세종', '대전', '광주', '대구', '울산',
  ];

  final List<String> _nationalities = const [
    '중국', '일본', '대만', '미국', '베트남', '필리핀', '홍콩', '태국', '말레이시아', '싱가폴'
  ];

  final List<Post> _posts = const [
    Post(title: '존댓말', content: '저만 아직도 어려운가요?', timeAgo: '1 minute ago', flag: '🇩🇪'),
    Post(title: '교환학생', content: '카레부어스트 공급하실분?', timeAgo: '1 minute ago', flag: '🇩🇪'),
    Post(title: '네덜란드 분들께', content: '펜타포트 두 장 예매했습니다. 같이 가실 분?', timeAgo: '1 minute ago', flag: '🇳🇱', imageUrl: 'https://picsum.photos/id/43/150/150'),
    Post(title: '김치찌개 레시피', content: '독일식으로 바꿔봤습니다!...', timeAgo: '1 minute ago', flag: '🇩🇪'),
    Post(title: '안녕하세요', content: '학기 중에 일본 가시는 분 계신가요?', timeAgo: '1 minute ago', flag: '🇯🇵'),
    Post(title: '제주도', content: '너무 좋다~!!', timeAgo: '1 minute ago', flag: '🇰🇷'),
  ];

  Future<void> _showFilterSelectionModal(List<String> options, String filterType) async {
    String? currentValue;
    if (filterType == '지역') {
      currentValue = _selectedRegion;
    } else if (filterType == '국적') {
      currentValue = _selectedNationality;
    }

    String modalDescription = '';
    if (filterType == '지역') {
      modalDescription = '선택한 지역 사용자의 글만 보여드려요.';
    } else if (filterType == '국적') {
      modalDescription = '선택한 국가 사용자의 글만 보여드려요.';
    }

    final String? selectedOption = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '$filterType 필터 선택',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Text(
                  modalDescription,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Color(0xFFF0F0F0), thickness: 1, height: 1),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      final bool isSelected = currentValue == null;
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                        leading: isSelected
                            ? Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                ),
                              )
                            : const SizedBox(width: 6),
                        title: Text(
                          '필터 없음',
                          style: TextStyle(
                            color: isSelected ? Colors.blueAccent : Colors.grey,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        onTap: () => Navigator.pop(context, null),
                      );
                    }
                    final option = options[index - 1];
                    final bool isSelected = option == currentValue;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                      leading: isSelected
                          ? Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            )
                          : const SizedBox(width: 6),
                      title: Text(
                        option,
                        style: TextStyle(
                          color: isSelected ? Colors.blueAccent : Colors.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () => Navigator.pop(context, option),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    setState(() {
      if (filterType == '지역') {
        _selectedFilter = selectedOption == null ? '최신순' : '지역';
        _selectedRegion = selectedOption;
        if (selectedOption != null) _selectedNationality = null;
      } else if (filterType == '국적') {
        _selectedFilter = selectedOption == null ? '최신순' : '국적';
        _selectedNationality = selectedOption;
        if (selectedOption != null) _selectedRegion = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const SearchHeader(),
            const Divider(thickness: 1, height: 1, color: Color(0xFFF0F0F0)),
            _buildBoardHeader(),
            Container(height: 8, color: const Color(0xFFF7F7F7)),
            Expanded(
              child: ListView.separated(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                    title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.w900)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          post.content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              post.timeAgo,
                              style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 8),
                            Text(post.flag),
                          ],
                        ),
                      ],
                    ),
                    trailing: post.imageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              post.imageUrl!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 1, indent: 16, endIndent: 16);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0.0,
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildBoardHeader() {
    Widget titleWidget;
    final String boardName = widget.boardName;

    if (boardName.contains(' ')) {
      final int splitIndex = boardName.indexOf(' ');
      final String firstPart = boardName.substring(0, splitIndex);
      final String secondPart = boardName.substring(splitIndex);

      titleWidget = RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontFamily: 'Pretendard',
          ),
          children: [
            const TextSpan(text: ''),
            TextSpan(
              text: firstPart,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
            TextSpan(text: secondPart),
          ],
        ),
      );
    } else {
      titleWidget = Text(
        boardName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleWidget,
          Row(
            children: [
              FilterButton(
                label: '최신순',
                isSelected: _selectedFilter == '최신순',
                displayText: '최신순',
                onTap: () {
                  setState(() {
                    _selectedFilter = '최신순';
                    _selectedRegion = null;
                    _selectedNationality = null;
                  });
                },
              ),
              FilterButton(
                label: '지역',
                isSelected: _selectedFilter == '지역' || _selectedRegion != null,
                displayText: _selectedRegion ?? '지역',
                onTap: () => _showFilterSelectionModal(_regions, '지역'),
              ),
              FilterButton(
                label: '국적',
                isSelected: _selectedFilter == '국적' || _selectedNationality != null,
                displayText: _selectedNationality ?? '국적',
                onTap: () => _showFilterSelectionModal(_nationalities, '국적'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


