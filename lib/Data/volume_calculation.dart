import 'dart:math';
String volumePicker(String input, String output, String inputTextField)
{
  double inputVolume;
  double outputValue = 0 ;
  if(inputTextField.isEmpty)
  {
    return "";
  }
  try {
    inputVolume = double.parse(inputTextField);
  } catch (e) {
    return "Invalid input";
  }

  if(input == "cm\u00B3" && output == "m\u00B3") {
      outputValue = cmTom(inputVolume);
    } else if(input == "m\u00B3" && output == "cm\u00B3") {
    outputValue = mTocm(inputVolume);
  } else if(input == "Liter" && output == "milliliter") {
    outputValue = lTom(inputVolume);
  } else if(input == "milliliter" && output == "Liter") {
    outputValue = mTol(inputVolume);
  } else if(input == "milliliter" && output == "m\u00B3") {
    outputValue = cmTom(inputVolume);
  }else if(input == "m\u00B3" && output == "milliliter") {
    outputValue = mTocm(inputVolume);
  }else if(input == "cm\u00B3" && output == "Liter") {
    outputValue = mTol(inputVolume);
  }else if(input == "Liter" && output == "cm\u00B3") {
    outputValue = lTom(inputVolume);
  }else if(input == "Liter" && output == "m\u00B3") {
    outputValue = mTol(inputVolume);
  }else if(input == "m\u00B3" && output == "Liter") {
    outputValue = lTom(inputVolume);
  } else {
      return "Invalid Conversion";
    }

  return outputValue.toString();
}

double cmTom(double input)
{
  input = input/(pow(10,6));
  return input;
}

double mTocm(double input)
{
  input *= (pow(10,6));

  return input;
}

double lTom(double input)
{
  input *= 1000;
  return input;
}

double mTol(double input)
{
  input /= 1000;
  return input;
}