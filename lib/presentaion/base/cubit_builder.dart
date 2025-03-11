import 'package:flutter/material.dart';



import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseState state, Widget child) {
  if (state is LoadingState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      BaseWidgets.showPopUpDialog(context, [
        BaseWidgets.buildAnimatedImage(LottieAssets.loading, false),
      ]);
    });
  } else if (state is SuccessState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      BaseWidgets.showPopUpDialog(context, [
        BaseWidgets.buildAnimatedImage(LottieAssets.success, false),
        BaseWidgets.buildMessage(context, state.message),
      ]);
    });
  } else if (state is EmptyState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.error, false),
      BaseWidgets.buildMessage(
        context,
        state.message ?? 'empty Content',
        ColorManager.black,
      ),
      BaseWidgets.buildButton(
        displayType: state.displayType,
        context: context,
        onTap: state.retry,
        title: StringsManager.retryAgain,
      ),
    ]);
  } else if (state is ErrorState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BaseWidgets.showPopUpDialog(
        context,
        [

          BaseWidgets.buildAnimatedImage(LottieAssets.error, false),
          BaseWidgets.buildMessage(context, state.errorMessage),
          BaseWidgets.buildButton(
            displayType: state.displayType,
            context: context,
            // onTap: state.retry,
            title: StringsManager.retryAgain,
          ),
        ],
      );
    });
  }

  return child;
}