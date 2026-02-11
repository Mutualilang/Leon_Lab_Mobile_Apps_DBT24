import 'package:flutter/material.dart';
import '../widgets/instagram_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Fakestagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 111,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildStoryItem(
                  username: index == 0 ? 'Your story' : 'user_$index',
                  isYourStory: index == 0,
                );
              },
            ),
          ),
          
          Divider(height: 1, color: Colors.grey.shade300),
          
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return InstagramPost(
                username: 'user_${index + 1}',
                userImage: 'https://i.pravatar.cc/150?img=${index + 1}',
                images: [
                  'https://picsum.photos/400/400?random=${index * 3 + 1}',
                  'https://picsum.photos/400/400?random=${index * 3 + 2}',
                  'https://picsum.photos/400/400?random=${index * 3 + 3}',
                ],
                likes: 6767 + (index * 321),
                caption: 'This is a beautiful post about nature and life! 🌟 #Fakestagram #photography',
                timeAgo: '${index + 1}h ago',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem({required String username, bool isYourStory = false}) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isYourStory
                  ? null
                  : const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFCAF45),
                        Color(0xFFFA7E1E),
                        Color(0xFFD62976),
                        Color(0xFF962FBF),
                        Color(0xFF4F5BD5),
                      ],
                    ),
              border: isYourStory
                  ? Border.all(color: Colors.grey.shade300, width: 2)
                  : null,
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: isYourStory
                  ? Icon(Icons.add, color: Colors.grey.shade600, size: 24)
                  : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            username,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}