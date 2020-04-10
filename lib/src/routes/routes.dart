import 'package:assistant_cardy/src/pages/producto_page.dart';
import 'package:assistant_cardy/src/pages/producto_page2.dart';
import 'package:flutter/material.dart';

import 'package:assistant_cardy/src/pages/home_page.dart';


  Map<String, WidgetBuilder> getAplicationRoutes(){
    return <String, WidgetBuilder>{
        '/'      : (BuildContext context)=>HomePage(),
        'productos'  : (BuildContext context)=>ProductoPage(),
        'productos2'  : (BuildContext context)=>ProductoPage2(),
    };

  }
