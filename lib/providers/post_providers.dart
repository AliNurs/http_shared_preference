// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preference/data/post_model.dart';

import 'package:shared_preference/post_repo.dart';

class PostProvider extends ChangeNotifier {
  PostProvider({
    required this.postRepo,
  });
  String errorMessage = '';
  bool isLoading = false;

  final PostRepo postRepo;
  List<PostModel> posts = [];

  getPosts() async {
    await Future.delayed(Duration(seconds: 3));

    isLoading = true;
    await Future.delayed(Duration(seconds: 3));
    notifyListeners();
    try {
      final result = await postRepo.getPosts();
      final listJson = json.decode(result.body) as List;
      posts = listJson.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      errorMessage = 'Проверьте подключение Интернета';
    }
    isLoading = false;
    notifyListeners();
  }
}
