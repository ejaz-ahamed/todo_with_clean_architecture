import 'dart:developer';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';

final class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase({required this.repository});

  Future<void> call({required int id}) async {
    try {
      await repository.deleteTodo(id);
    } catch (e) {
      log(e.toString());
    }
  }
}
