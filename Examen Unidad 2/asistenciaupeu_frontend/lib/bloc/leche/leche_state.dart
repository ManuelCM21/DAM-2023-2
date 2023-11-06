// ignore_for_file: must_be_immutable
part of 'leche_bloc.dart';

@immutable
abstract class LecheState {}

class LecheInitialState extends LecheState {}

class LecheLoadingState extends LecheState {}

class LecheLoadedState extends LecheState {
  List<LecheModelo> lecheList;
  LecheLoadedState(this.lecheList);
}

class LecheError extends LecheState {
  Error e;
  LecheError(this.e);
}
