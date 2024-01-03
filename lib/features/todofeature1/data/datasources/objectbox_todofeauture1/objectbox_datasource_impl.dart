import 'package:todo_app_clean_arch/core/objectBox/todo_objectbox.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/datasources/objectbox_todofeauture1/objectbox_datasource.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/models/todo_entity_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'objectbox_datasource_impl.g.dart';

class ObjectBoxDataSourceImpl implements ObjectBoxDataSource {
  final box = ObjectBox.instance.todoBox;
  @override
  Future<void> addTodo(TodoEntityModel todo) async {
    box.put(todo);
  }

  @override
  Future<void> deleteTodo(int id) async {
    box.remove(id);
  }

  @override
  List<TodoEntityModel> getTodo() {
    return box.getAll();
  }

  @override
  Future<void> updateTodo(TodoEntityModel todo) async {
    box.put(todo);
  }
}

@riverpod
ObjectBoxDataSource todoDataSource(TodoDataSourceRef ref) {
  return ObjectBoxDataSourceImpl();
}
