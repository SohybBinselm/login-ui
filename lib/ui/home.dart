import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }

}

class BmiState extends State<Bmi>{
  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _finalResult = 0.0;
  void _calculate(){
    setState(() {
      _finalResult = 703*double.parse(_weightController.text) / (double.parse(_heightController.text)*12*12 * double.parse(_heightController.text));
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI",
          style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 19.6
          ),),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: EdgeInsets.all(4.5),
          children: <Widget>[
            new Image.asset("images/bmi.png",
              height: 150.0,
              width: 70.0,
            ),

            new Padding(padding: EdgeInsets.all(8.0)),

            new Container(
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height In Feet",
                        icon: new Icon(Icons.assessment)
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lb",
                        icon: new Icon(Icons.line_weight)
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(7.0)),
                  new RaisedButton(
                    onPressed: _calculate,
                    child: new Text("Calculate",
                      style: new TextStyle(
                          color: Colors.white
                      ),),
                    color: Colors.pinkAccent,
                  ),
                  new Padding(padding: EdgeInsets.all(5))


                ],
              ),
            ),
            new Text("Your BMI: ${_finalResult.toStringAsFixed(1)}",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 19.6,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500
              ),
            ),
            new Padding(padding: EdgeInsets.all(5.0)),

            new Text("Overweight ",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 19.6,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w500
              ),
            )

          ],
        ),
      ),
    );
  }
}