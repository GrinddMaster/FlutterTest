import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'list_items.dart';


TextField inputValue()
{
  final  userInput = TextEditingController();
  return TextField(
    controller: userInput,
    decoration:  InputDecoration(
      border: const OutlineInputBorder(),
      hintText: 'Conversion',
      suffixIcon: IconButton(
          onPressed: (){userInput.clear();},
          icon:  const Icon(Icons.clear)
      )
    ),
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,
    ],

  );
}
TextField outputValue()
{
  return  TextField(
    readOnly: true,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      hintText: "OutPut"
    ),
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,
    ],
  );
}

class UnitCalc extends StatefulWidget
{
     final Color appBarcolor;
     const UnitCalc(this.appBarcolor, {super.key});
    @override
    UnitCalcState createState() => UnitCalcState();
}

class UnitCalcState extends State<UnitCalc>
{
  List<String> tempConvList = ["Celsius","Kelvin","Fahrenheit"];
  List<String> lengthList = ["m","cm","mm"];
  List<String> timeList = ["Min","Hrs","Sec"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Convert',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
            ,) ,
          backgroundColor: widget.appBarcolor,
          leading: BackButton(
            color: Colors.white,
            onPressed: (){ Navigator.pop(context);},
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:10 ),
              child: inputValue(),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.arrow_downward),
            ),
            const Divider(),
            outputValue(),
           Row(
            children: [
              DropdownButton<String>(
                padding: const EdgeInsets.only(left: 50),
                value:tempChosen, // Set the initial value
                onChanged: (String? newValue){
                  setState(() {
                    tempChosen = newValue!;
                  });
                },
                items: tempConvList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Padding(padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.arrow_forward_outlined),
              ),
              DropdownButton<String>(
                padding: const EdgeInsets.only(left: 20),
                value:outputTemp, // Set the initial value
                onChanged: (String? newValue){
                  setState(() {
                    outputTemp = newValue!;
                  });
                },
                items:
                tempConvList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          )  
          ],
        ),
      ),
    );
  }
}

