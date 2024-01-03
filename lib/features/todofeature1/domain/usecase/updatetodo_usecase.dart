import 'dart:developer';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';

final class UpdateTodoUsecase {
  final TodoRepository repository;

  UpdateTodoUsecase({required this.repository});

  Future<void> call(
      {required String title, required bool isChecked, required int id}) async {
    try {
      if (title.trim().isEmpty) {
        log('title is empty');
      }
      final todo = TodoEntity(id: id, title: title, isChecked: isChecked);
      repository.updateTodo(todo);
    } catch (e) {
      log(e.toString());
    }
  }
}
