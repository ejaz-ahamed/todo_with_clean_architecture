import 'package:flutter/material.dart';
import 'package:todo_app_clean_arch/core/themes/extensions/todo_color_extension.dart';
import 'package:todo_app_clean_arch/core/themes/extensions/todo_space_extension.dart';

final class TodoTheme {
  final BuildContext context;
  TodoTheme.of(this.context);

  TodoColorExtension get colors {
    return Theme.of(context).extension<TodoColorExtension>()!;
  }

  TodoSpaceExtension get spaces {
    return Theme.of(context).extension<TodoSpaceExtension>()!;
  }
}
