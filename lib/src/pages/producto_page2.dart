
import 'package:assistant_cardy/src/models/producto_model2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class ProductoPage2 extends StatefulWidget {
  
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage2> {
 
      DatabaseReference itemRef;
     List<MyProductoModel> productos = new List();
     MyProductoModel producto;
   
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
  
  @override
  void initState() {
    super.initState();
    producto = MyProductoModel("", "", 0.0, 0.0);
    final  database = FirebaseDatabase.instance; // intancia de mi base de datos
    itemRef = database.reference().child('productos');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
  }
  _onEntryAdded(Event event) {
    setState(() {
      productos.add(MyProductoModel.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = productos.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      productos[productos.indexOf(old)] = MyProductoModel.fromSnapshot(event.snapshot);
    });
  }
 void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(producto.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column( // creando mi lista
        children: <Widget>[
        Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                  width: double.maxFinite,
                  child: Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                         ListTile(
                          leading: Icon(Icons.album),
                          title: Text(productos[index].nombre, style: TextStyle(color: Colors.black)),
                          subtitle: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                  Text('Precio: '+(productos[index].precio).toString()),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                  Text('stock: '+(productos[index].stock).toString()),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

