import 'package:flutter/material.dart';
import 'package:http_fetch_by_riverpod/model/post.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.p});
  final PostModel p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              p.title,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Image.network(
              p.url,
              height: 50,
              width: 60,
            )
          ],
        ),
      ),
    );
  }
}
