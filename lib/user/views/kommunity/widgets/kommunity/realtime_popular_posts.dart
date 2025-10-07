import 'package:flutter/material.dart';

class RealtimePopularPosts extends StatelessWidget {
  final List<Map<String, dynamic>> posts;

  const RealtimePopularPosts({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('익', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 8),
                    Text(post['author'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text(post['date']),
                  ],
                ),
                const SizedBox(height: 8),
                Text(post['title'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(post['content']),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.favorite, color: Colors.red),
                    Text('${post['likes']}'),
                    const SizedBox(width: 8),
                    const Icon(Icons.comment, color: Colors.blue),
                    Text('${post['comments']}'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


