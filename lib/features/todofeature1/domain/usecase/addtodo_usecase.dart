import 'dart:developer';

import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';

final class AddTodoUsecase {
  final TodoRepository repository;

  AddTodoUsecase({required this.repository});

  Future<void> call({required String title, required bool isChecked}) async {
    try {
      if (title.trim().isEmpty) {
        log('title is empty');
      }
      final todo = TodoEntity(id: 0, title: title, isChecked: isChecked);
      repository.addTodo(todo);
    } catch (e) {
      log(e.toString());
    }
  }
}
