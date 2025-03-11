import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/presentaion/home_screen/view/widgets/tasks_list_view.dart';
import 'package:linkyou_task/presentaion/home_screen/view_model/home_view_model.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s14),
      child: TasksListView(viewModel: viewModel),
    );
  }
}
