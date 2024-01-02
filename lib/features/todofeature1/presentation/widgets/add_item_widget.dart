import 'package:flutter/material.dart';
import 'package:todo_app_clean_arch/core/themes/app_theme.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/widgets/add_or_upadate_widget.dart';

class AddItemButtonWidget extends StatelessWidget {
  const AddItemButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: TodoTheme.of(context).colors.primary,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddOrUpdateWidget(),
            ));
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
