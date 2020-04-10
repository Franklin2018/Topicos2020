// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    String idProducto;
    String nombre;
    double precio;
    double stock;

    ProductoModel({
        this.idProducto,
        this.nombre = '',
        this.precio = 0.0,
        this.stock  = 0.0,
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        idProducto: json["id_producto"],
        nombre    : json["nombre"],
        precio    : json["precio"].toDouble(),
        stock     : json["stock"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id_producto" : idProducto,
        "nombre"      : nombre,
        "precio"      : precio,
        "stock"       : stock,
    };
}

