import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  factory TodoEntity({
    required int id,
    required String title,
    required bool isChecked,
  }) = _TodoEntity;
}
