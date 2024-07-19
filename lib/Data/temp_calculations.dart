String tempPicker(String input, String output, String inputTextField) {
  double inputValue;
  double outputValue;
if(inputTextField.isEmpty)
  {
    return "";
  }
  try {
    inputValue = double.parse(inputTextField);
  } catch (e) {
    return "Invalid input";
  }

  if (input == "Celsius" && output == "Fahrenheit") {
    outputValue = cTof(inputValue);
  } else if (input == "Fahrenheit" && output == "Celsius") {
    outputValue = fToc(inputValue);
  } else if (input == "Celsius" && output == "Kelvin") {
    outputValue = cTok(inputValue);
  } else if (input == "Kelvin" && output == "Celsius") {
    outputValue = kToc(inputValue);
  } else if (input == "Fahrenheit" && output == "Kelvin") {
    outputValue = fTok(inputValue);
  } else if (input == "Kelvin" && output == "Fahrenheit") {
    outputValue = kTof(inputValue); } else {
    return "Invalid conversion";
  }

  return outputValue.toString();
}

double cTof(double input) {
  return input * 9/5 + 32;
}

double fToc(double input) {
  return (input - 32) * 5/9;
}

double kToc(double input) {
  return input - 273.15;
}

double cTok(double input) {
  return input + 273.15;
}

double fTok(double input) {
  return (input - 32) * 5/9 + 273.15;
}

double kTof(double input) {
  return input * 9/5 - 459.67;
}
