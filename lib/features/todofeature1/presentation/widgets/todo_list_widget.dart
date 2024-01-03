import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/models/todo_entity_model.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/pages/add_or_upadate_page.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/providers/todo_provider.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/widgets/delete_widget.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    void deleteTodo(TodoEntityModel todo) {
      showDialog(
        context: context,
        builder: (context) => DeleteWidget(todo: todo),
      );
    }

    void updateTodo(TodoEntityModel todo) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const AddOrUpdatePage();
        },
      ));
    }

    final spaces = TodoTheme.of(context).spaces;
    final colors = TodoTheme.of(context).colors;
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Checkbox(
                value: ref.watch(todoProvider)[index].isChecked,
                onChanged: (value) {},
              ),
              title: Text(
                ref.watch(todoProvider)[index].title!,
                style: TextStyle(color: colors.text),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      updateTodo(ref.watch(todoProvider)[index]);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTodo(ref.watch(todoProvider)[index]);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: spaces.space_200,
              ),
          itemCount: ref.watch(todoProvider).length),
    );
  }
}
