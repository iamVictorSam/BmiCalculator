import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home>{
  //Logical Aspect
  final TextEditingController _ageController = new  TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double meter = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void _calculateBMI(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      meter = height*0.3048;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0)
      && ((_heightController.text.isNotEmpty || meter > 0)
      && (_weightController.text.isNotEmpty || weight > 0))){
        result = weight / (meter * meter);

        //Do the reading
        if(double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);

        }else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25) {
          _resultReading = "Great Shape!";
          print(_resultReading);

        } else if(double.parse(result.toStringAsFixed(1)) >= 25.0 && result < 30.0){
          _resultReading = "OverWeight";

        }else if(double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }


      } else {
        result = 0.0;
      }
    });



    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  void _eraseAll() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _ageController.clear();
      _finalResult = "";
      _resultReading = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: new EdgeInsets.all(5.0),
          children: [
            new Image.asset("images/bmilogo.png",
            height: 120.0,
            width: 138.0,),

            new Card(
              shadowColor: Colors.black,
              color: Colors.white,
              elevation: 7.0,
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: new Container(
                height: 260.0,
                width: 380.0,
                margin: EdgeInsets.all(12.50),
                //color: Colors.black12,
                //margin: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: new Column(
                  children: [
                    new TextField(
                      keyboardType: TextInputType.number,
                      controller: _ageController,
                      decoration: new InputDecoration(
                          hintText: "Age",
                          //labelText: "In Kilograms",
                          icon: new Icon(Icons.person)
                      ),
                    ),

                    new TextField(
                      keyboardType: TextInputType.number,
                      controller: _heightController,
                      decoration: new InputDecoration(
                          hintText: "Height",
                          labelText: "In Feet",
                          icon: new Icon(Icons.equalizer)
                      ),
                    ),

                    new TextField(
                      keyboardType: TextInputType.number,
                      controller: _weightController,
                      decoration: new InputDecoration(
                          hintText: "Weight",
                          labelText: "In Kilograms",
                          icon: new Icon(Icons.line_weight)
                      ),
                    ),

                    new Padding(padding: EdgeInsets.all(10.0)),

                    new Center(
                      child: new Row(
                        children: [
                          new Container(
                            margin: const EdgeInsets.only(left: 40.0),
                            child: new RaisedButton(
                              onPressed: _calculateBMI, color: Colors.purpleAccent,
                              child: new Text("Calculate", style: new TextStyle(color: Colors.white, fontSize: 20,
                                  fontWeight: FontWeight.w500),),),
                          ),

                          new Container(
                            margin: const EdgeInsets.only(left: 45.0),
                            child: new RaisedButton(
                              onPressed:  _eraseAll, color: Colors.purpleAccent,
                              child: new Text("Clear", style: new TextStyle(color: Colors.white, fontSize: 20,
                                  fontWeight: FontWeight.w500),),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

              )

            ),

            //Output Field

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                new Padding(padding: EdgeInsets.all(10.0),),
                new Text(
                  "$_finalResult",
                  style: new TextStyle(color: Colors.purpleAccent,
                      fontWeight: FontWeight.w500, fontSize: 22.5, fontStyle: FontStyle.italic),
                ),

                new Padding(padding: EdgeInsets.all(10.0) ,) ,

                new Text(
                  "$_resultReading",
                  style: new TextStyle(color: Colors.green,
                    fontWeight: FontWeight.w500, fontSize: 22.5, fontStyle: FontStyle.italic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }




// double calcBmi(double height, double weight){
//    double bmi;
//    if(height.isNaN && weight.isNaN){
//      bmi = 0;
//    }
//    bmi = weight / _heightConversion(height);
//    return bmi;
// }

// double _heightConversion(double height){
//    double h;
//    if(!height.isNaN){
//      h = height * 12;
//    }
//    return h;
//  }

}