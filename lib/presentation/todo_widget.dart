import 'package:flutter/material.dart';
import 'package:sample/models/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentCtrl = TextEditingController(text: todo.content);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            todo.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: TextField(
                controller: contentCtrl,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
