import 'package:flutter/material.dart';
import 'unit_calc.dart';

String tempChosen = "Celsius";
String outputTemp = "Celsius";
String timeChosen = "Min";
String outputTime = "Min";
String lengthChosen = "m";
String outputLength = "m";

DropdownButton temp(String valueChosen,List<String> items,void Function(String) onChanged) {
  return
    DropdownButton<String>(
      padding: const EdgeInsets.only(left: 50),
      value:valueChosen, // Set the initial value
      onChanged: (String? newValue){
        onChanged(newValue!);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
}
DropdownButton lengthConv(String valueChosen,List<String> items,void Function(String) onChanged) {
  return
    DropdownButton<String>(
      padding: const EdgeInsets.only(left: 50),
      value:valueChosen, // Set the initial value
      onChanged: (String? newValue){
        onChanged(newValue!);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
}
DropdownButton timeConv(String valueChosen,List<String> items,void Function(String) onChanged) {
  return
    DropdownButton<String>(
      padding: const EdgeInsets.only(left: 50),
      value:valueChosen, // Set the initial value
      onChanged: (String? newValue){
        onChanged(newValue!);
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
}
String inputConv(String type)
{
  switch(type)
  {
    case 'temp':return tempChosen;
    case 'length':return lengthChosen;
    case 'time':return timeChosen;
    default:return "";
  }
}
String outputConv(String type)
{
switch(type)
  {
    case 'temp':return outputTemp;
    case 'length':return outputLength;
    case 'time':return outputTime;
    default:return "";
  }
}
List<String> visibleList(String type)
{
  List<String>empty = [];
  switch(type)
      {
    case 'temp':return tempConvList;
    case 'length':return lengthList;
    case 'time':return timeList;
    default:return empty;
  }
}
