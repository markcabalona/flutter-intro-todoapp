import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sample/data/fake_datasource.dart';
import 'package:sample/presentation/home_page.dart';
import 'package:sample/providers/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(db: FakeDataSource()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
