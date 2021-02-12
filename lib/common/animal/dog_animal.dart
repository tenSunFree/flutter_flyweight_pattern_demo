import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/i_animal.dart';

class DogAnimal implements IAnimal {
  final String name;
  final IconData iconData;
  String age;
  String bodyWeight;

  DogAnimal({
    @required this.name,
    @required this.iconData,
  })  : assert(name != null),
        assert(iconData != null);

  @override
  String getName() {
    return name;
  }

  @override
  IconData getIconData() {
    return iconData;
  }

  @override
  String getAge() {
    return age;
  }

  @override
  String getBodyWeight() {
    return bodyWeight;
  }

  @override
  void setAge(String age) {
    this.age = age;
  }

  @override
  void setBodyWeight(String bodyWeight) {
    this.bodyWeight = bodyWeight;
  }
}
