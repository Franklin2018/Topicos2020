
import 'package:flutter/material.dart';

import 'package:assistant_cardy/src/routes/routes.dart';
import 'package:assistant_cardy/src/pages/producto_page.dart';
import 'package:firebase_core/firebase_core.dart';


//void main() => runApp(MyApp());
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options:const FirebaseOptions(
            googleAppID: '1:762915908917:android:2030b2722167bd5e61f07c',
            apiKey: 'AIzaSyBMV4iE4oHRIfJymx03AFkbutnbBH1Ey5E',
            databaseURL: 'https://myproyecto1-50d78.firebaseio.com/',
           // gcmSenderID: 'com.example.project_topico'
          ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assistant Cardy',
      initialRoute: '/',
     
      routes: getAplicationRoutes(),

      onGenerateRoute: (RouteSettings setting){
        return MaterialPageRoute(builder: (BuildContext context)=>ProductoPage());
      },
    );
  }
} 
