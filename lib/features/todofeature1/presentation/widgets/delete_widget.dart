import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/constants/todofeature1/text/home_constants.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/providers/todo_provider.dart';

class DeleteWidget extends ConsumerWidget {
  final TodoEntity todo;
  const DeleteWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(ref.watch(hmConstProvider).delText),
      content: const Text("This todo will delete permenantly"),
      actions: [
        TextButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            child: const Text(
              "Cancel",
            )),
        TextButton(
          onPressed: () {
            ref.read(todoProvider.notifier).deleteTodo(todo.id);
            Navigator.of(context).pop();
          },
          child: Text(
            "Delete",
            style: TextStyle(color: TodoTheme.of(context).colors.primary),
          ),
        )
      ],
    );
  }
}
