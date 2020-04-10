import 'package:assistant_cardy/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:assistant_cardy/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
   
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], //informacion que tendra por defecto hasta que se resuelva el future
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot)
              =>ListView(children: _listaItems( snapshot.data, context))
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) { //metodo que devuelve una lista de widgets
    
    final List<Widget> opciones = [];

    data.forEach( (opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        //leading: Icon(Icons.playlist_add_check, color:Colors.blue), //icon a la izq.
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue,), //icon a la der.
        onTap: (){  //metodo que se activa al hacer taps sobre el widget
        Navigator.pushNamed(context, opt['ruta']);
        },

      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }
}