import 'package:flutter_flyweight_pattern_demo/common/animal/animal_type.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/bird_animal.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/cat_animal.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/dog_animal.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/i_animal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimalFlyweightFactory {
  static const int ANIMAL_COUNT = 10;
  final Map<AnimalType, IAnimal> _map = Map<AnimalType, IAnimal>();

  AnimalFlyweightFactory();

  IAnimal getAnimal(AnimalType type) {
    if (!_map.containsKey(type)) {
      switch (type) {
        case AnimalType.Dog:
          return DogAnimal(name: "狗", iconData: FontAwesomeIcons.dog);
        case AnimalType.Cat:
          return CatAnimal(name: "貓", iconData: FontAwesomeIcons.cat);
        case AnimalType.Bird:
          return BirdAnimal(name: "鳥", iconData: FontAwesomeIcons.kiwiBird);
      }
    }
    return _map[type];
  }
}
