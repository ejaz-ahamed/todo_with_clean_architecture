import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/pages/add_or_upadate_page.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/providers/todo_provider.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/widgets/delete_widget.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void deleteTodo(TodoEntity todo) {
      showDialog(
        context: context,
        builder: (context) => DeleteWidget(todo: todo),
      );
    }

    void updateTodo(TodoEntity todo) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AddOrUpdatePage(
            todo: todo,
          );
        },
      ));
    }

    final spaces = TodoTheme.of(context).spaces;
    final colors = TodoTheme.of(context).colors;
    return ref.watch(todoProvider).when(
          data: (data) {
            return Scaffold(
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: data[index].isChecked,
                        onChanged: (value) {},
                      ),
                      title: Text(
                        data[index].title,
                        style: TextStyle(color: colors.text),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              updateTodo(data[index]);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteTodo(data[index]);
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
                  itemCount: data.length),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error Occured while fetching Data"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
