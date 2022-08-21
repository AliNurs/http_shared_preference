import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences on Flutter',
      home: HomePage(),
    );
  }
}






// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => PostProvider(postRepo: PostRepo()),
//       child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: const MyHomePage()),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<PostProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 vm.getPosts();
//                 PostProvider(postRepo: PostRepo()).getPosts();
//               },
//               icon: const Icon(Icons.get_app))
//         ],
//       ),
//       body: ListView(
//           padding: const EdgeInsets.all(
//             12,
//           ),
//           children: [
//             if (vm.isLoading) CircularProgressIndicator(),
//             if (vm.errorMessage.isEmpty && vm.posts.isEmpty && !vm.isLoading)
//               Text(
//                 'Список пусто, Загрузите данные',
//                 textAlign: TextAlign.center,
//               ),
//             if (vm.errorMessage.isEmpty && vm.posts.isNotEmpty && !vm.isLoading)
//               ...vm.posts
//                   .map(
//                     (e) => MyListTileItem(
//                         id: e.id.toString(),
//                         title: e.title,
//                         subtitle: e.subtitle),
//                   )
//                   .toList(),
//             if (vm.errorMessage.isNotEmpty && !vm.isLoading)
//               Text(
//                 vm.errorMessage,
//                 textAlign: TextAlign.center,
//               )
//           ]),
//     );
//   }
// }
