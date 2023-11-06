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
import 'package:shared_preferences/shared_preferences.dart';

class LecheForm extends StatefulWidget {
  @override
  _LecheFormState createState() => _LecheFormState();
}
class _LecheFormState extends State<LecheForm> {
  TextEditingController _fecha = new TextEditingController();
  DateTime? selectedDate;

  late String _litrosLeche = "";
  late String _turno = "";
  late String _finca = "";
  late String _ganado = "";
  var _data = [];

  @override
  void initState() {
    super.initState();
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
              margin: EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildDatoFecha(capturaFecha, "Fecha"),
                    _buildDatoCadena(capturaLitrosLeche, "Litros:"),
                    _buildDatoCadena(capturaTurno, "Turno:"),
                    _buildDatoCadena(capturaFinca, "Finca:"),
                    _buildDatoCadena(capturaGanado, "Ganado:"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState!.save();
                                LecheModelo mp = new LecheModelo.unlaunched();
                                //print(DateFormat('yyyy-MM-dd').format(currentTime));
                                mp.fecha = DateFormat('yyyy-MM-dd')
                                    .format(DateTime.parse(_fecha.value.text));
                                mp.litrosLeche = _litrosLeche;
                                mp.turno = _turno;
                                mp.finca = _finca;
                                mp.ganado = _ganado;

                                print(
                                    "Fecha:${_fecha.value.text}, Litros:${_litrosLeche}, "
                                    "Turno:${_turno}, Finca:${_finca}, Ganado:${_ganado}");

                                BlocProvider.of<LecheBloc>(context).add(CreateLecheEvent(mp));

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

  Widget _buildDatoEntero(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
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

  Widget _buildDatoCadena(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
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
      Function obtValor, _dato, String label, List<dynamic> listaDato) {
    return DropDownFormField(
      titleText: label,
      hintText: 'Seleccione',
      value: _dato,
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
