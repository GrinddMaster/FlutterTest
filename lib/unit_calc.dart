import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'list_items.dart';

List<String>currentList = [];
List<String> tempConvList = ["Celsius","Kelvin","Fahrenheit"];
List<String> lengthList = ["m","cm","mm","km"];
List<String> timeList = ["Min","Hrs","Sec"];
String inputTextField = " ";
String outputTextField = " ";
String currentItem = "";
String currentItemOut = "";
String typeGetter = "";

 final TextEditingController textOutput = TextEditingController();
final TextEditingController userInput = TextEditingController();
TextField inputValue()
{
  inputTextField = userInput.text.toString();
  return TextField(
    onChanged: (value){textFieldChanger(typeGetter, currentItem, currentItemOut);},
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
    controller: textOutput,
    readOnly: true,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      hintText: "OutPut"
    ),
  //  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,
    //],
  );
}
void updateOutput()
{
  textOutput.text = outputTextField;
   inputTextField = userInput.text;
}

class UnitCalc extends StatefulWidget
{
     final Color appBarcolor;
     final String type;
     const UnitCalc(this.appBarcolor,this.type, {super.key});
    @override
    UnitCalcState createState() => UnitCalcState();
}

class UnitCalcState extends State<UnitCalc>
{
  @override
void initState() {
    super.initState();
    inputTextField = userInput.text;
    currentList = visibleList(widget.type);
    currentItem = inputConv(widget.type);
    currentItemOut = outputConv(widget.type);
  }
  @override
  Widget build(BuildContext context) {
    typeGetter = widget.type;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Convert',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
            ,) ,
          backgroundColor: widget.appBarcolor,
          leading: BackButton(
            color: Colors.white,
            onPressed: (){
              textOutput.text = "";
              userInput.text = "";
              Navigator.pop(context);},
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
                value:currentItem, // Set the initial value
                onChanged: (String? newValue){
                  setState(() {
                    currentItem = newValue!;
                  });
                },
                items: currentList.map<DropdownMenuItem<String>>((String value) {
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
                value:currentItemOut, // Set the initial value
                onChanged: (String? newValue){
                  setState(() {
                    currentItemOut = newValue!;
                  });
                },
                items:
                currentList.map<DropdownMenuItem<String>>((String value) {
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

