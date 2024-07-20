
String timePicker(String input, String output, String inputTextField)
{
  String outputTextField = "";
  int inputValue = 0;
  try{
     inputValue = int.parse(inputTextField);
  }
  catch(e){
    return "Invalid input $inputTextField";
  }

  if(inputTextField.isEmpty)
  {
    return "";
  } else if(input == "Min" && output == "Hrs") {
     outputTextField = mToH(inputValue);
  } else if(input == "Hrs" && output == "Min") {
   outputTextField = hTom(inputValue);
  } else if(input == "Sec" && output == "Min") {
    outputTextField = sTom(inputValue);
  } else if(input == "Min" && output == "Sec") {
    outputTextField = mTos(inputValue);
  } else if(input == "Hrs" && output == "Sec") {
    outputTextField = hTos(inputValue);
  } else if(input == "Sec" && output == "Hrs") {
    outputTextField = sToh(inputValue);
  } else{
    outputTextField = inputValue.toString();
  }

  return outputTextField;
}

String mToH(int input)
{
  input = input ~/ 60;
  return input.toString();
}
String hTom(int input)
{
  input *= 60;
  return input.toString();
}
String sTom(int input)
{
  input = input ~/ 60 ;
  return input.toString();
}
String mTos(int input)
{
  input *= 60;
  return input.toString();
}
String hTos(int input)
{
  input *= 3600;
  return input.toString();
}
String sToh(int input)
{
  input = input~/3600 ;
  return input.toString();
}