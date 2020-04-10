
import 'package:flutter/material.dart';

import 'package:assistant_cardy/src/providers/productos_provider.dart';
import 'package:assistant_cardy/src/models/producto_model.dart';


class ProductoPage extends StatefulWidget {
  
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
     final productosProvider = ProductosProvider();

 @override
  void initState() { 
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos')
      ),  
      body:_crearListado(),
    );
   
  }

   Widget _crearListado(){

      return FutureBuilder(
        future: productosProvider.cargarProductos(),
        builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
          
          if( snapshot.connectionState == ConnectionState.done){
            final productos = snapshot.data;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItem(productos[i]),
              );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      );
  }

  Widget _crearItem(ProductoModel producto){
 
    return Card(
       elevation: 3.0, //elevacion de la tarjeta (sombra)
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
      child: ListTile(
        leading: FlutterLogo(size: 56.0),
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('${producto.nombre}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text('Precio: Bs. ${producto.precio}', style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        subtitle: Text('Stock: ${producto.stock}'
        ),
         onTap: (){},
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    );
  }
}