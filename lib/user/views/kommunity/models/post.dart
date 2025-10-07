class Post {
  final String title;
  final String content;
  final String timeAgo;
  final String flag;
  final String? imageUrl;

  const Post({
    required this.title,
    required this.content,
    required this.timeAgo,
    required this.flag,
    this.imageUrl,
  });
}


