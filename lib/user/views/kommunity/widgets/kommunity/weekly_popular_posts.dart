import 'package:flutter/material.dart';

class WeeklyPopularPosts extends StatelessWidget {
  final List<Map<String, dynamic>> posts;

  const WeeklyPopularPosts({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Text('${index + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            title: Text(post['title']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Text('${post['likes']}'),
              ],
            ),
          ),
        );
      },
    );
  }
}


