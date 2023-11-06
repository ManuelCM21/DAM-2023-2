import 'package:asistenciaupeu_frontend/modelo/LecheModelo.dart';
import 'package:asistenciaupeu_frontend/repository/LecheRepository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'leche_event.dart';
part 'leche_state.dart';

class LecheBloc extends Bloc<LecheEvent, LecheState> {
  late final LecheRepository _lecheRepository;
  LecheBloc(this._lecheRepository) : super(LecheInitialState()) {
    on<LecheEvent>((event, emit) async {
      print("Bloc x");
      if (event is ListarLecheEvent) {
        emit(LecheLoadingState());
        try {
          print("pasox!!");
          List<LecheModelo> lecheList =
              await _lecheRepository.getLeche();
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      } else if (event is DeleteLecheEvent) {
        try {
          await _lecheRepository.deleteLeche(event.leche.id);
          emit(LecheLoadingState());
          List<LecheModelo> lecheList =
              await _lecheRepository.getLeche();
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      } else if (event is CreateLecheEvent) {
        try {
          await _lecheRepository.createLeche(event.leche);
          emit(LecheLoadingState());
          List<LecheModelo> lecheList =
              await _lecheRepository.getLeche();
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      } else if (event is UpdateLecheEvent) {
        try {
          await _lecheRepository.updateLeche(
              event.leche.id, event.leche);
          emit(LecheLoadingState());
          List<LecheModelo> lecheList =
              await _lecheRepository.getLeche();
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      }
    });
  }
}
