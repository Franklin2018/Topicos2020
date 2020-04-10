import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:assistant_cardy/src/models/producto_model.dart';

class ProductosProvider{

  final String _url = 'https://myproyecto1-50d78.firebaseio.com'; // url de mi base de datos en firebase



 //metodo para mostar la lista de productos

 Future<List<ProductoModel>> cargarProductos() async{

   final url  = '$_url/productos.json'; //aqui hacemos la peticion
   final resp = await http.get(url);    //aqui tenemos una respuesta

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos  = new List();

      if( decodedData == null) return [];

      decodedData.forEach( (id, prod){
        final prodTem = ProductoModel.fromJson(prod);

        prodTem.idProducto = id;
        
        productos.add(prodTem);

      });
    //print(productos);
    return productos;
  
 } 
  

}