import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'base_states.dart';

abstract class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(InitialState());

  void start(BuildContext context);

  void emitLoading() => emit(LoadingState());

  void emitError({
    required String errorMessage,
  }) =>
      emit(ErrorState(
        errorMessage,
      ));

  void emitSuccess(String message) => emit(SuccessState(message));
}
