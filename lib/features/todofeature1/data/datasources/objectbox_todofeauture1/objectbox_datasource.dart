import 'package:todo_app_clean_arch/features/todofeature1/data/models/todo_entity_model.dart';

abstract class ObjectBoxDataSource {
  Future<void> addTodo(TodoEntityModel todo);
  Future<void> deleteTodo(int id);
  Future<void> updateTodo(TodoEntityModel todo);
  List<TodoEntityModel> getTodo();
}
