import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Topicos",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Topicos"),),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Body(),
      )
    );
  }
}

class Body extends StatefulWidget{

  @override
  BodyState createState() {
    return BodyState();
  }
}

class BodyState extends State<Body>{

  final _formKey = GlobalKey<FormState>();

  final controllerA = TextEditingController();
  final controllerB = TextEditingController();


  @override
  void dispose() {
    controllerA.dispose();
    controllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: controllerA,
                decoration: new InputDecoration(labelText: "a"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: controllerB,
                decoration: new InputDecoration(labelText: "b"),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: (){
                    return showDialog(
                      context: context,
                      builder: (context){
                        double a = double.parse(controllerA.text);
                        double b = double.parse(controllerB.text);
                        double c = a + b;
                        return AlertDialog(
                          content: Text("Suma = " + c.toString()),
                        );
                      }
                    );
                  },
                  child: Text("Suma"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}