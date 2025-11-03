import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NATHONEl XYZ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Stories section
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage('https://picsum.photos/seed/${index + 1}/200/300'),
                      ),
                      const SizedBox(height: 5),
                      Text('user_${index + 1}'),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          // Posts section
          _buildPost(
            username: 'nathonel_xyz',
            userAvatarUrl: 'https://picsum.photos/seed/1/200/300',
            postImageUrl: 'https://picsum.photos/seed/101/600/800',
            caption: 'This is my first post! #flutter #instagramclone',
            likes: '1,234',
          ),
          _buildPost(
            username: 'flutter_dev',
            userAvatarUrl: 'https://picsum.photos/seed/2/200/300',
            postImageUrl: 'https://picsum.photos/seed/102/600/800',
            caption: 'Loving this new app!',
            likes: '5,678',
          ),
           _buildPost(
            username: 'google',
            userAvatarUrl: 'https://picsum.photos/seed/3/200/300',
            postImageUrl: 'https://picsum.photos/seed/103/600/800',
            caption: 'Another beautiful day!',
            likes: '9,101',
          ),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String username,
    required String userAvatarUrl,
    required String postImageUrl,
    required String caption,
    required String likes,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(userAvatarUrl),
              ),
              const SizedBox(width: 8),
              Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Post Image
        Image.network(postImageUrl),
        // Action Buttons
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('$likes likes', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: '$username ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),
        ),
         // Comments
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'View all comments',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
