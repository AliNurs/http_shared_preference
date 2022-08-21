// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/post_repo.dart';
import 'package:shared_preference/providers/post_providers.dart';

import 'package:shared_preference/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'myListTile_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(postRepo: PostRepo()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PostProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                vm.getPosts();
                PostProvider(postRepo: PostRepo()).getPosts();
              },
              icon: const Icon(Icons.get_app))
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.all(
            12,
          ),
          children: [
            if (vm.isLoading) CircularProgressIndicator(),
            if (vm.errorMessage.isEmpty && vm.posts.isEmpty && !vm.isLoading)
              Text(
                'Список пусто, Загрузите данные',
                textAlign: TextAlign.center,
              ),
            if (vm.errorMessage.isEmpty && vm.posts.isNotEmpty && !vm.isLoading)
              ...vm.posts
                  .map(
                    (e) => MyListTileItem(
                        id: e.id.toString(),
                        title: e.title,
                        subtitle: e.subtitle),
                  )
                  .toList(),
            if (vm.errorMessage.isNotEmpty && !vm.isLoading)
              Text(
                vm.errorMessage,
                textAlign: TextAlign.center,
              )
          ]),
    );
  }
}
