import 'dart:math';

class CalculatorFormula {

  CalculatorFormula({this.weight, this.height});

  final int? height;
  final int? weight;
  double _bmi = 0.0;

  String calculateBMI(){
    _bmi = weight! / pow(height!/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if (_bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getFeedback(){
    if(_bmi>=25){
      return 'Your weight it more than expected, try to work out more and watch your diet. 😪😪😪';
    }else if (_bmi>18.5){
      return 'Congratulations your weight is normal, keep it up! 👌🎉🎉';
    }else{
      return 'You weight is below the acceptable minimum, try to eat a bit more. Check out your diet.😴😫😫😫';
    }
  }

}
