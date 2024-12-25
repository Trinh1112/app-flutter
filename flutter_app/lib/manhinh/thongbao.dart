import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông Báo'),
        backgroundColor: const Color.fromARGB(255, 35, 206, 63),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Tiêu đề danh sách thông báo
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Thông Báo Mới Nhất',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 177, 88),
                ),
              ),
            ),

            // Các thẻ thông báo
            NotificationCard(
              title: 'Tin nhắn mới từ Admin',
              description: 'Lịch học của bạn đã được cập nhật.',
              time: 'Vừa xong',
            ),
            NotificationCard(
              title: 'Bài tập mới được đăng',
              description:
                  'Một bài tập mới đã được đăng trong khóa học của bạn.',
              time: '5 phút trước',
            ),
            NotificationCard(
              title: 'Nhắc nhở kỳ thi sắp tới',
              description:
                  'Kỳ thi tiếp theo của bạn được lên lịch vào ngày mai.',
              time: '1 giờ trước',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 43, 177, 88),
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        trailing: Text(
          time,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
