import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_fetch_by_riverpod/model/post.dart';
import 'package:http_fetch_by_riverpod/provider/postProvider.dart';
import 'package:http_fetch_by_riverpod/screens/detail.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getPostProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod http Example"),
        centerTitle: true,
      ),
      body: data.when(
          data: (data) {
            List<PostModel> postlist = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(p: postlist[index])));
                        },
                        child: Card(
                          color: Colors.blue,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(postlist[index].title),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
