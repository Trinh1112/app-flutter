import 'package:flutter/material.dart';

class Manhinh5 extends StatelessWidget {
  const Manhinh5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/image1.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              const Positioned(
                top: 160,
                left: 16,
                child: Text(
                  'Tin nhắn',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 169, 210, 244),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm tin nhắn...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ChatTile(
                  name: 'Yoo Jin',
                  message: 'Đây là một địa điểm tuyệt vời',
                  time: '9:41 SA',
                  unreadMessages: 2,
                  imageUrl: 'assets/images/image2.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          name: 'Yoo Jin',
                          message: 'Đây là một địa điểm tuyệt vời',
                        ),
                      ),
                    );
                  },
                ),
                ChatTile(
                  name: 'Jonathan P',
                  message: 'Chúng ta có thể bắt đầu lúc 8 giờ sáng',
                  time: '10:30 SA',
                  imageUrl: 'assets/images/image3.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          name: 'Jonathan P',
                          message: 'Chúng ta có thể bắt đầu lúc 8 giờ sáng',
                        ),
                      ),
                    );
                  },
                ),
                ChatTile(
                  name: 'Myung Dae',
                  message: 'Hẹn gặp lại vào ngày mai',
                  time: '11:30 SA',
                  imageUrl: 'assets/images/image4.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          name: 'Myung Dae',
                          message: 'Hẹn gặp lại vào ngày mai',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadMessages;
  final String imageUrl;
  final VoidCallback onTap;

  const ChatTile({super.key, 
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.unreadMessages = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: 30,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: Colors.grey[700],
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey)),
          if (unreadMessages > 0)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadMessages.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String message;

  const ChatDetailScreen({super.key, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tin nhắn từ: $name',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
