import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<Post> posts = [
    Post(
      username: 'Ram Bahadur Singh',
      userImageUrl: 'assets/images/people2.jpeg',
      imageUrl: 'assets/images/post1.jpeg',
      description: 'Look at my fresh produce!',
      likes: 100,
    ),
    Post(
      username: 'Jaynath Singh',
      userImageUrl: 'assets/images/people1.jpeg',
      imageUrl: 'assets/images/post5.jpeg',
      description: 'Life grows where seeds are sown.',
      likes: 20,
    ),
    Post(
      username: 'Ashok Singh',
      userImageUrl: 'assets/images/people5.jpeg',
      imageUrl: 'assets/images/post6.jpeg',
      description: 'In the field of dreams.',
      likes: 89,
    ),
    Post(
      username: 'Amarjeet Yadav',
      userImageUrl: 'assets/images/people3.jpeg',
      imageUrl: 'assets/images/post3.jpeg',
      description: 'Cultivating dreams and harvesting joy',
      likes: 47,
    ),
    Post(
      username: 'Sukhverr Sahu',
      userImageUrl: 'assets/images/people4.jpeg',
      imageUrl: 'assets/images/post4.jpeg',
      description: 'Had a great harvest today.',
      likes: 80,
    ),
  ];

  void _addNewPost(String username, String userImageUrl, String imageUrl,
      String description) {
    setState(() {
      posts.add(Post(
          username: username,
          userImageUrl: userImageUrl,
          imageUrl: imageUrl,
          description: description));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewPostScreen(onSubmit: _addNewPost),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 2, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(post.userImageUrl),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        post.username,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      post.imageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(post.description),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.thumb_up),
                            onPressed: () {
                              setState(() {
                                post.likes++;
                              });
                            },
                          ),
                          Text('${post.likes} likes'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NewPostScreen extends StatelessWidget {
  final Function(String, String, String, String) onSubmit;

  NewPostScreen({super.key, required this.onSubmit});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userImageUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _userImageUrlController,
              decoration: const InputDecoration(labelText: 'User Image URL'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onSubmit(
                  _usernameController.text,
                  _userImageUrlController.text,
                  _imageUrlController.text,
                  _descriptionController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final String username;
  final String userImageUrl;
  final String imageUrl;
  final String description;
  int likes;

  Post({
    required this.username,
    required this.userImageUrl,
    required this.imageUrl,
    required this.description,
    this.likes = 0,
  });
}
