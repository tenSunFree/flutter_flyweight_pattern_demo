import 'package:flutter/widgets.dart';

abstract class IAnimal {
  String getName();

  IconData getIconData();

  String getAge();

  String getBodyWeight();

  void setAge(String age);

  void setBodyWeight(String bodyWeight);
}
