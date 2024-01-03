import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/models/todo_entity_model.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/repository/todo_repository_impl.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/usecase/addtodo_usecase.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/usecase/deletetodo_usecase.dart';
part 'todo_provider.g.dart';

@riverpod
class Todo extends _$Todo {
  late final TextEditingController todoController;
  late TodoRepository repository;

  @override
  List<TodoEntityModel> build() {
    todoController = TextEditingController();
    repository = ref.watch(todoRepositoryProvider);

    ref.onDispose(dispose);
    return repository.getTodo();
  }

  void dispose() {
    todoController.dispose();
  }

  Future<String?> addTodo() async {
    try {
      final title = todoController.text;
      await AddTodoUsecase(repository: repository)(
          title: title, isChecked: false);
      state = repository.getTodo();
      todoController.clear();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<int?> deleteTodo(int id) async {
    try {
      await DeleteTodoUsecase(repository: repository)(id: id);
      state = repository.getTodo();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

}
