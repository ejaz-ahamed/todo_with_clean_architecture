import 'package:objectbox/objectbox.dart';

@Entity()
class TodoEntityModel {
  @Id()
  int id = 0;

  String? title;
  bool? isChecked;

  TodoEntityModel({this.id = 0, required this.title, required this.isChecked});
}
