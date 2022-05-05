import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/presentation/new_todo_form.dart';
import 'package:sample/presentation/todo_widget.dart';
import 'package:sample/providers/todo_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TODO List"),
        ),
        body: Center(
          child: Consumer<TodoProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.todos.length,
              itemBuilder: ((context, index) => ListTile(
                    leading: Text(value.todos[index].id.toString()),
                    title: Text(value.todos[index].title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        value.deleteTodo(index);
                      },
                    ),
                    onTap: () {
                      showBottomSheet(
                          context: context,
                          elevation: 20,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          clipBehavior: Clip.hardEdge,
                          builder: (_) {
                            return Container(
                              height: 300,
                              color: Theme.of(context).primaryColorLight,
                              alignment: Alignment.center,
                              child: TodoWidget(todo: value.todos[index]),
                            );
                          });
                    },
                  )),
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const NewTodoForm();
            },
          );
        }),
      ),
    );
  }
}
