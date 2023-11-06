// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps, unnecessary_new, prefer_final_fields, no_logic_in_create_state, library_private_types_in_public_api, use_key_in_widget_constructors, must_be_immutable

import 'package:asistenciaupeu_frontend/apis/leche_api.dart';
import 'package:asistenciaupeu_frontend/bloc/leche/leche_bloc.dart';
import 'package:asistenciaupeu_frontend/comp/DropDownFormField.dart';
import 'package:asistenciaupeu_frontend/modelo/LecheModelo.dart';
import 'package:asistenciaupeu_frontend/theme/AppTheme.dart';
import 'package:asistenciaupeu_frontend/util/TokenUtil.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LecheFormEdit extends StatefulWidget {
  LecheModelo modelA;

  LecheFormEdit({required this.modelA}) : super();

  @override
  _LecheFormEditState createState() => _LecheFormEditState(modelA: modelA);
}

class _LecheFormEditState extends State<LecheFormEdit> {
  LecheModelo modelA;
  _LecheFormEditState({required this.modelA}) : super();

  late int _periodoId = 0;

  TextEditingController _fecha = new TextEditingController();
  DateTime? selectedDate;

  late String _litrosLeche = "";
  late String _turno = "";
  late String _finca = "";
  late String _ganado = "";

  @override
  void initState() {
    super.initState();
    print(modelA.fecha);
    _fecha.text = modelA.fecha;
  }

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );

  void capturaFecha(valor) {
    this._fecha.text = valor;
  }

  void capturaLitrosLeche(valor) {
    this._litrosLeche = valor;
  }

  void capturaTurno(valor) {
    this._turno = valor;
  }

  void capturaFinca(valor) {
    this._finca = valor;
  }

  void capturaGanado(valor) {
    this._ganado = valor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Leche B"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildDatoFecha(capturaFecha, "Fecha"),
                    _buildDatoCadena(
                        capturaLitrosLeche, modelA.litrosLeche, "Litros:"),
                    _buildDatoCadena(capturaTurno, modelA.turno, "Turno:"),
                    _buildDatoCadena(capturaFinca, modelA.finca, "Turno:"),
                    _buildDatoCadena(capturaGanado, modelA.ganado, "Turno:"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );

                                _formKey.currentState!.save();
                                LecheModelo mp = LecheModelo.unlaunched();
                                mp.fecha = DateFormat('yyyy-MM-dd')
                                    .format(DateTime.parse(_fecha.value.text));
                                mp.litrosLeche = _litrosLeche;
                                mp.turno = _turno;
                                mp.finca = _finca;
                                mp.ganado = _ganado;
                                mp.id = modelA.id;

                                print(
                                    "Fecha:${_fecha.value.text}, Litros:${_litrosLeche}, "
                                    "Turno:${_turno}, Finca:${_finca}, Ganado:${_ganado}");

                                BlocProvider.of<LecheBloc>(context)
                                    .add(UpdateLecheEvent(mp));
                                Navigator.pop(context, () {
                                  //setState(() {});
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'No estan bien los datos de los campos!'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget buildDatoEntero(Function obtValor, String dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: dato,
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Id es campo Requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(int.parse(value!));
      },
    );
  }

  Widget _buildDatoCadena(Function obtValor, String dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: dato,
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDatoLista(
      Function obtValor, dato, String label, List<dynamic> listaDato) {
    return DropDownFormField(
      titleText: label,
      hintText: 'Seleccione',
      value: dato,
      onSaved: (value) {
        setState(() {
          obtValor(value);
        });
      },
      onChanged: (value) {
        setState(() {
          obtValor(value);
        });
      },
      dataSource: listaDato,
      textField: 'display',
      valueField: 'value',
    );
  }

  Future<void> _selectDate(BuildContext context, Function obtValor) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        obtValor(selectedDate.toString());
      });
    }
  }

  Widget _buildDatoFecha(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: _fecha,
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onTap: () {
        _selectDate(context, obtValor);
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }
}
