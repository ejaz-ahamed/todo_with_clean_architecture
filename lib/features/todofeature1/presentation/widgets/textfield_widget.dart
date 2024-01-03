import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/constants/todofeature1/text/home_constants.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/providers/todo_provider.dart';

class TextFieldWidget extends ConsumerWidget {
  final TodoEntity? todo;
  const TextFieldWidget({super.key, this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = TodoTheme.of(context).colors;
    return TextField(
      controller: ref.read(todoProvider.notifier).todoController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black, width: 1)),
        hintText: todo != null
            ? ref.watch(hmConstProvider).textfield1
            : ref.watch(hmConstProvider).titleTextAdd,
        hintStyle: TextStyle(color: color.text),
      ),
    );
  }
}
