import 'package:flutter/material.dart';
import 'package:linkyou_task/presentaion/home_screen/view_model/home_view_model.dart';
import '../../../../data/models/responses/tasks_response/tasks.dart';
import '../../../resources/strings_manager.dart';

void showEditDialog(BuildContext context, HomeViewModel viewModel, Todos todo) {
  final TextEditingController controller = TextEditingController(text: todo.todo);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(StringsManager.editTask),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: StringsManager.taskName),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(StringsManager.cancel),
        ),
        TextButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              viewModel.editTask(todo.id ?? -1, controller.text);
            }
            Navigator.pop(context);
          },
          child: const Text(StringsManager.save),
        ),
      ],
    ),
  );
}
