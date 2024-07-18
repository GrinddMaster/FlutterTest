
String distPicker(String input, String output, String inputTextField)
{
  String outputTextField = "";
  int inputValue = 0;
  try{
    inputValue = int.parse(inputTextField);
  }catch(e){
    return "Invalid input $inputTextField";
  }
  if(input == "cm" && output == "m")
    {
      outputTextField = cmTom( inputValue);
    }
  if(input == "m" && output == "cm")
  {
    outputTextField = mTocm(inputValue);
  }
  if(input == "km" && output == "m")
  {
    outputTextField = kmTom(inputValue);
  }
  if(input == "m" && output == "km")
  {
    outputTextField = mTokm(inputValue);
  }
  if(input == "cm" && output == "km")
  {
    outputTextField = cmTokm(inputValue);
  }
  if(input == "km" && output == "cm")
  {
    outputTextField = kmTocm(inputValue);
  }
  if(input == "mm" && output == "cm")
  {
    outputTextField = mmTocm(inputValue);
  }
  if(input == "cm" && output == "mm")
  {
    outputTextField = cmTomm(inputValue);
  }

  return outputTextField;
}

String cmTom(int input)
{
  input = (input ~/ 100) ;
  return input.toString();
}
String mTocm(int input)
{
  input *= 100;
  return input.toString();
}
String mTokm(int input)
{
  input = (input ~/1000) ;
  return input.toString();
}
String kmTom(int input)
{
  input *= 1000;
  return  input.toString();
}
String kmTocm(int input)
{
  input *= 100000;
  return input.toString();
}
String cmTokm(int input)
{
  input = (input ~/100000);
  return  input.toString();
}
String mmTocm(int input)
{
  input = (input~/10);// ~/ for integer division.
  return input.toString();
}
String cmTomm(int input)
{
  input *= 10;
  return input.toString();
}
