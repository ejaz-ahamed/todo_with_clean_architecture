import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

class HomeConstants {
  final titleText = 'Todo App';
  final titleTextAdd = 'Add Todo';
  final titleTextUpd = 'Update Todo';
  final btnTextAdd = 'Save';
  final btnTextEdit = 'Edit';
  final uiText = 'Todo List is Empty';
  final textfield1 = 'Edit your Todo';
  final delText = "Are you sure ?";
  
}

@riverpod
HomeConstants hmConst(HmConstRef ref) {
  return HomeConstants();
}
