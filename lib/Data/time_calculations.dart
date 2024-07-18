
String timePicker(String input, String output, String inputTextField)
{
  String outputTextField = "";
  int inputValue = 0;
  if(inputTextField.isEmpty)
    {
      return "";
    }
  try{
     inputValue = int.parse(inputTextField);
  }
  catch(e){
    return "Invalid input $inputTextField";
  }
  if(input == "Min" && output == "Hrs")
    {
     outputTextField = mToH(inputValue);
    }

  if(input == "Hrs" && output == "Min")
  {
   outputTextField = hTom(inputValue);
  }
  if(input == "Sec" && output == "Min")
  {
    outputTextField = sTom(inputValue);
  }
  if(input == "Min" && output == "Sec")
  {
    outputTextField = mTos(inputValue);
  }
  if(input == "Hrs" && output == "Sec")
  {
    outputTextField = hTos(inputValue);
  }
  if(input == "Sec" && output == "Hrs")
  {
    outputTextField = sToh(inputValue);
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