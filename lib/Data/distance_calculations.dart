
String distPicker(String input, String output, String inputTextField)
{
  String outputTextField = "";
  double inputValue = 0;
  if(inputTextField.isEmpty)
    {
      return "";
    }
  try{
    inputValue = double.parse(inputTextField);
  }catch(e){
    return "Invalid input $inputTextField";
  }
  if(input == "cm" && output == "m")
    {
      outputTextField = cmTom( inputValue);
    } else if(input == "m" && output == "cm") {
    outputTextField = mTocm(inputValue);
  } else if(input == "km" && output == "m") {
    outputTextField = kmTom(inputValue);
  } else if(input == "m" && output == "km") {
    outputTextField = mTokm(inputValue);
  } else if(input == "cm" && output == "km") {
    outputTextField = cmTokm(inputValue);
  } else if(input == "km" && output == "cm") {
    outputTextField = kmTocm(inputValue);
  } else if(input == "mm" && output == "cm") {
    outputTextField = mmTocm(inputValue);
  } else if(input == "cm" && output == "mm") {
    outputTextField = cmTomm(inputValue);
  } else {
    outputTextField = inputValue.toString();
  }

  return outputTextField;
}

String cmTom(double input)
{
  input = (input / 100) ;
  return input.toString();
}
String mTocm(double input)
{
  input *= 100;
  return input.toString();
}
String mTokm(double input)
{
  input = (input /1000) ;
  return input.toString();
}
String kmTom(double input)
{
  input *= 1000;
  return  input.toString();
}
String kmTocm(double input)
{
  input *= 100000;
  return input.toString();
}
String cmTokm(double input)
{
  input = (input /100000);
  return  input.toString();
}
String mmTocm(double input)
{
  input = (input/10);// ~/ for integer division.
  return input.toString();
}
String cmTomm(double input)
{
  input *= 10;
  return input.toString();
}
