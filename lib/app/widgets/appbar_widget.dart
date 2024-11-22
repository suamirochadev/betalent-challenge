import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: const Text('CG'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/notification.png',
            ),
          ),
        ],
        title: const Text(''),
      ),
    );
  }
}
