import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

class HomeConstants {
  final titleText = 'Todo App';
  final titleTextAdd = 'Add Todo';
  final titleTextUpd = 'Update Todo';
}

@riverpod
HomeConstants hmConst(HmConstRef ref) {
  return HomeConstants();
}
