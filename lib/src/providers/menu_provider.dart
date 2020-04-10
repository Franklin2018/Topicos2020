

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    // cargarData();
  }

   Future<List <dynamic>> cargarData() async{ //se va construir cuando todo este proceso termine
    final resp = await rootBundle.loadString('data/menu_opts.json');
      
      Map dataMap = json.decode( resp );
      // print(dataMap[ 'rutas' ]); //esto se ejecutaba primero
      opciones = dataMap['rutas'];
    return opciones;
   }
}

final menuProvider = new _MenuProvider();