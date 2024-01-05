import 'dart:developer';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';

final class GetTodoUsecase {
  final TodoRepository repository;

  GetTodoUsecase({required this.repository});

  Future<List<TodoEntity>> call() async {
    try {
      return repository.getTodo();
    } catch (e) {
      log(e.toString());
    }

    throw 'Cannot get todos';
  }
}
