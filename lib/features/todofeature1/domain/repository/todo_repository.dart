import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<void> addTodo(TodoEntity todo);
  Future<void> deleteTodo(int id);
  Future<void> updateTodo(TodoEntity todo);
  List<TodoEntity> getTodo();
}
