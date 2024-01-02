import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/constants/todofeature1/text/home_constants.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';

class AddOrUpdateWidget extends ConsumerWidget {
  final TodoEntity? todo;

  const AddOrUpdateWidget({super.key, this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = TodoTheme.of(context).colors;
    final spaces = TodoTheme.of(context).spaces;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(todo != null
            ? ref.watch(hmConstProvider).titleTextUpd
            : ref.watch(hmConstProvider).titleTextAdd),
      ),
    );
  }
}
