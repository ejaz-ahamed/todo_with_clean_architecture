import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/datasources/objectbox_todofeauture1/objectbox_datasource.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/datasources/objectbox_todofeauture1/objectbox_datasource_impl.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/models/todo_entity_model.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/entities/todo_entity.dart';
import 'package:todo_app_clean_arch/features/todofeature1/domain/repository/todo_repository.dart';
part 'todo_repository_impl.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  final ObjectBoxDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<void> addTodo(TodoEntity todo) async {
    final todoToAdd =
        TodoEntityModel(title: todo.title, isChecked: todo.isChecked);
    dataSource.addTodo(todoToAdd);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await dataSource.deleteTodo(id);
  }

  @override
  List<TodoEntity> getTodo() {
    final todos = dataSource.getTodo();
    return [
      for (final todo in todos)
        TodoEntity(
          id: todo.id,
          title: todo.title!,
          isChecked: todo.isChecked!,
        )
    ];
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    final todoToUpdate =
        TodoEntityModel(title: todo.title, isChecked: todo.isChecked)
          ..id = todo.id;
    dataSource.updateTodo(todoToUpdate);
  }
}

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepositoryImpl(dataSource: ref.watch(todoDataSourceProvider));
}
