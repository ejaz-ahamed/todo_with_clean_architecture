import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_clean_arch/core/constants/todofeature1/text/home_constants.dart';
import 'package:todo_app_clean_arch/features/todofeature1/presentation/widgets/add_item_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ref.watch(hmConstProvider).titleText),
      ),
      floatingActionButton: const AddItemButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
