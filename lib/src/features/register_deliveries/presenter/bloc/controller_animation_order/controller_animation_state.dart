part of 'controller_animation_cubit.dart';

abstract class ControllerAnimationState extends Equatable {
  const ControllerAnimationState();

  @override
  List<Object> get props => [];
}

class ControllerAnimationInitial extends ControllerAnimationState {}

class ControllerAnimationReturned extends ControllerAnimationState {
  final bool isForward;
  const ControllerAnimationReturned({required this.isForward});
}
