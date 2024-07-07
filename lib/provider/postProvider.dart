import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_fetch_by_riverpod/model/post.dart';
import 'package:http_fetch_by_riverpod/service/service.dart';

final postProvider = Provider<ApiService>((ref) => ApiService());

final getPostProvider = FutureProvider<List<PostModel>>((ref) async {
  return ref.watch(postProvider).getData();
});
