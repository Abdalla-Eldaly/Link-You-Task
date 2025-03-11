import 'package:flutter/material.dart';
import 'package:linkyou_task/presentaion/home_screen/view/widgets/task_card.dart';
import 'package:linkyou_task/presentaion/home_screen/view/widgets/edit_task_dialog.dart';
import 'package:linkyou_task/presentaion/home_screen/view_model/home_view_model.dart';
import '../../../../core/common/widgets/shimmer_effect.dart';

class TasksListView extends StatelessWidget {
  final HomeViewModel viewModel;

  const TasksListView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: viewModel.todos.length + (viewModel.hasMoreData ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < viewModel.todos.length) {
          final todo = viewModel.todos[index];
          return TaskCard(
            todo: todo,
            onEdit: () => showEditDialog(context, viewModel, todo),
            onDelete: () => viewModel.deleteTask(todo.id ?? -1),
            onToggleComplete: (value) =>
                viewModel.toggleTaskComplete(todo.id ?? -1, value ?? false, todo.todo ?? ''),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: const ShimmerEffect(),
          );
        }
      },
    );
  }
}
