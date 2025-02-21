import 'package:flutter/material.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Dua'),
        backgroundColor: Colors.green.shade300,
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
                  size: 35,
              color: Colors.blue,
            ),

            Icon(
              Icons.spa,
              size: 35,
              color: Colors.green,
            ),

            Icon(
              Icons.phone_android,
              size: 35,
              color: Colors.black,
            ),

            Icon(
              Icons.headphones,
              size: 35,
              color: Colors.black,
            ),

            Icon(
              Icons.email,
              size: 35,
              color: Colors.red,
            ),

          ],
        ),
      ),
    );
  }
}