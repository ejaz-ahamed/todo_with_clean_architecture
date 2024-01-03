import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_clean_arch/features/todofeature1/data/models/todo_entity_model.dart';
import 'package:todo_app_clean_arch/objectbox.g.dart';

class ObjectBox {
  static ObjectBox? _instance;

  final Store store;
  late final Box<TodoEntityModel> todoBox;

  ObjectBox._create(this.store) {
    todoBox = store.box<TodoEntityModel>();
  }

  static ObjectBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'Todo'));
      _instance = ObjectBox._create(store);
    }
  }
}
