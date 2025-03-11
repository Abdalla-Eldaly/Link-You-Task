import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/core/common/widgets/cached_image.dart';
import 'package:linkyou_task/core/providers/user_provider.dart';
import 'package:linkyou_task/presentaion/base/base_states.dart';
import 'package:linkyou_task/presentaion/base/cubit_builder.dart';
import 'package:linkyou_task/presentaion/base/cubit_listener.dart';
import 'package:linkyou_task/presentaion/home_screen/view/home_screen_body.dart';
import 'package:linkyou_task/presentaion/home_screen/view/widgets/custom_drawer.dart';
import 'package:linkyou_task/presentaion/home_screen/view_model/home_view_model.dart';
import 'package:linkyou_task/presentaion/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../core/di/di.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppSize.s70,
        title: Row(
          children: [
            Text('${userData.user?.firstName??''} ${userData.user?.lastName??''}' ),
            SizedBox(width: AppSize.s20,),
            CachedImage(imageUrl: userData.user?.image??'' , width: AppSize.s25,height: AppSize.s25,)
          ],
        ),
      ),
      drawer: const CustomDrawer(),

      body: BlocProvider(
        create: (context) => getIt.get<HomeViewModel>()..start(context),
        child: BlocConsumer<HomeViewModel, BaseState>(
          listener: (context, state) {
            baseListener(context, state);

          },
          builder: (context, state) {
            final viewModel = HomeViewModel.get(context);

            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100 &&
                    viewModel.hasMoreData &&
                    !viewModel.isLoadingMore) {
                  viewModel.fetchToDo();
                }
                return false;
              },
              child: baseBuilder(context, state, const HomeScreenBody()),
            );
          },
        ),
      ),
    );
  }
}
