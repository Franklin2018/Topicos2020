import 'package:flutter/material.dart';


final _icons =<String , IconData> 
{
    'store'     : Icons.store,
    'add_shopping_cart' : Icons.add_shopping_cart,
};

Icon getIcon(String nombreIcon)
{
  return Icon( _icons[nombreIcon], color: Colors.blue);
}