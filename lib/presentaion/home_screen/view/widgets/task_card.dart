import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:linkyou_task/data/models/responses/tasks_response/tasks.dart';
import 'package:linkyou_task/presentaion/resources/color_manager.dart';
import 'package:linkyou_task/presentaion/resources/strings_manager.dart';
import 'package:linkyou_task/presentaion/resources/text_style.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';

class TaskCard extends StatelessWidget {
  final Todos todo;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onToggleComplete;

  const TaskCard({
    super.key,
    required this.todo,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleComplete,
  });

  Future<bool> _checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void _handleDelete(BuildContext context) async {
    bool isConnected = await _checkInternetConnection();
    if (isConnected) {
      onDelete();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No internet connection. Cannot delete."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool? isCompleted = todo.completed;

    return Slidable(
      key: Key(todo.id.toString()),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [


          // Delete Task
          SlidableAction(
            onPressed: (_) => _handleDelete(context),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: StringsManager.delete,
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ],
      ),
      child: Card(
        elevation: isCompleted == true? 2 : 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s16)),
        color: isCompleted== true ? ColorManager.shimmerBase : ColorManager.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSize.s16),
          onTap: onEdit,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: isCompleted,
                    onChanged: onToggleComplete,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s4)),
                    activeColor: ColorManager.green,
                    side: BorderSide(
                        color: isCompleted== true ? Colors.grey : ColorManager.green, width: AppSize.s2),
                  ),
                ),
                const SizedBox(width: AppSize.s12),

                // Task Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.todo ?? "",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: isCompleted == true? TextDecoration.lineThrough : null,
                          color: isCompleted == true? Colors.grey : Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSize.s7_5),
                      Text(
                        "${StringsManager.userID.tr()} ${todo.userId}",
                        style: AppTextStyles.bodySmall.copyWith(
                            color: isCompleted == true? Colors.grey.shade600 : Colors.black54),
                      ),
                    ],
                  ),
                ),

                // Edit & Delete Icons
                IconButton(
                  icon: Icon(Icons.edit, color: isCompleted == true? Colors.grey : Colors.blueAccent),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => _handleDelete(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
