import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/constants/todofeature1/text/home_constants.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/providers/todo_provider.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/widgets/textfield_widget.dart';

class AddOrUpdatePage extends ConsumerWidget {
  final TodoEntity? todo;

  const AddOrUpdatePage({super.key, this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = TodoTheme.of(context).spaces;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(todo != null
              ? ref.watch(hmConstProvider).titleTextUpd
              : ref.watch(hmConstProvider).titleTextAdd),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(space.space_150),
            child: const TextFieldWidget(),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: TodoTheme.of(context).colors.primary,
          onPressed: () {
            ref.read(todoProvider.notifier).addTodo();
            Navigator.pop(context);
          },
          label: Text(todo != null
              ? ref.watch(hmConstProvider).btnTextEdit
              : ref.watch(hmConstProvider).btnTextAdd),
        ),
      ),
    );
  }
}
