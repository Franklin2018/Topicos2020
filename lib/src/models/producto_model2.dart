import 'package:firebase_database/firebase_database.dart';

class MyProductoModel {
  String key;
  String idProducto;
  String nombre;
  num stock = 0.0;
  num precio = 0.0;

  MyProductoModel(this.nombre, this.idProducto, this.stock, this.precio);

  MyProductoModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        nombre = snapshot.value["nombre"],
        idProducto = snapshot.value["id_producto"],
        stock = snapshot.value["stock"],
        precio = snapshot.value["precio"];
  toJson() {
    return {
      "nombre": nombre,
      "id_producto": idProducto,
      "stock": stock,
      "precio": precio,
    };
  }
}