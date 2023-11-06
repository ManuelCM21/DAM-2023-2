// ignore_for_file: must_be_immutable
part of 'leche_bloc.dart';

@immutable
abstract class LecheEvent {}

class ListarLecheEvent extends LecheEvent {
  ListarLecheEvent() {
    print("Evento si");
  }
//ListarLecheEvent({required LecheModelo leche}):super(leche:leche);
}

class DeleteLecheEvent extends LecheEvent {
  LecheModelo leche;
  DeleteLecheEvent(this.leche);
//DeleteLecheEvent({required LecheModelo leche}):super(leche:leche);
}

class UpdateLecheEvent extends LecheEvent {
  LecheModelo leche;
  UpdateLecheEvent(this.leche);
//UpdateLecheEvent({required LecheModelo leche}):super(leche:leche);
}

class CreateLecheEvent extends LecheEvent {
  LecheModelo leche;
  CreateLecheEvent(this.leche);
//CreateLecheEvent({required LecheModelo leche}):super(leche:leche);
}
