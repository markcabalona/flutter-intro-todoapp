import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/todo_provider.dart';

class NewTodoForm extends StatelessWidget {
  const NewTodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleCtrl = TextEditingController();
    final TextEditingController contentCtrl = TextEditingController();

    return Consumer<TodoProvider>(builder: (context, provider, _) {
      return Dialog(
        child: SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              
              child: Column(
                children: [
                  const Text("Add a TODO Note"),
                  TextFormField(
                    controller: titleCtrl,
                    decoration: const InputDecoration(
                      hintText: "Enter Title",
                      label: Text("Title"),
                    ),
                  ),
                  TextFormField(
                    controller: contentCtrl,
                    decoration: const InputDecoration(
                      hintText: "Enter description",
                      label: Text("Content"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.createTodo(
                        titleCtrl.text,
                        contentCtrl.text,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Create Todo'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
