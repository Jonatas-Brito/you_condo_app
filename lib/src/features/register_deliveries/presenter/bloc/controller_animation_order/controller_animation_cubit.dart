import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'controller_animation_state.dart';

class ControllerAnimationCubit extends Cubit<ControllerAnimationState> {
  ControllerAnimationCubit() : super(ControllerAnimationInitial());

  isForward({required bool isForward}) async {
    emit(ControllerAnimationReturned(isForward: isForward));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ControllerAnimationInitial());
  }
}
