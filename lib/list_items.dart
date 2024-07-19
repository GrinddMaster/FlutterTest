import 'package:flutter/material.dart';
import 'package:workpls/Data/volume_calculation.dart';
import 'unit_calc.dart';
import 'Data/temp_calculations.dart';
import 'package:workpls/Data/distance_calculations.dart';
import 'package:workpls/Data/time_calculations.dart';

String tempChosen = "Celsius";
String outputTemp = "Celsius";
String timeChosen = "Min";
String outputTime = "Min";
String lengthChosen = "m";
String outputLength = "m";
String volumeChosen = "cm\u00B3";
String outputVolume = "cm\u00B3";

void textFieldChanger(String type,String currentItem,String currentItemOut)
{
  if(type == "temp" ) {
    outputTextField = tempPicker(currentItem,currentItemOut,userInput.text);
    updateOutput();
  } else if(type == "time"){
    outputTextField = timePicker(currentItem, currentItemOut,userInput.text);
    updateOutput();
  } else if (type == "length") {
    outputTextField = distPicker(currentItem, currentItemOut,userInput.text);
    updateOutput();
  } else if (type == "volume") {
    outputTextField = volumePicker(currentItem, currentItemOut, userInput.text);
    updateOutput();
  }
}

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
    case 'volume':return volumeChosen;
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
  case 'volume':return outputVolume;
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
    case 'volume':return volumeList;
    default:return empty;
  }
}
