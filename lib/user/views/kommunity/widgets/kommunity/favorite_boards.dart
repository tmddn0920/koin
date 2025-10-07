import 'package:flutter/material.dart';

class FavoriteBoards extends StatelessWidget {
  final List<Map<String, dynamic>> boards;
  final void Function(Map<String, dynamic> board) onTapBoard;

  const FavoriteBoards({super.key, required this.boards, required this.onTapBoard});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];
          return ListTile(
            leading: Icon(board['icon'], color: Colors.blue, size: 20),
            title: Row(
              children: [
                Text(board['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    board['recent_post'],
                    style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () => onTapBoard(board),
          );
        },
      ),
    );
  }
}


