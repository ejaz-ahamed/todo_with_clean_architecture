import 'dart:developer';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';

final class GetTodoUsecase {
  final TodoRepository repository;

  GetTodoUsecase({required this.repository});

  Future<void> call() async {
    try {
      repository.getTodo();
    } catch (e) {
      log(e.toString());
    }
  }
}
