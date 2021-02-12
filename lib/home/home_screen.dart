import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/animal_flyweight_factory.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/animal_type.dart';
import 'package:flutter_flyweight_pattern_demo/common/animal/i_animal.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AnimalFlyweightFactory _animalFlyweightFactory;
  List<IAnimal> _animalList;

  @override
  void initState() {
    super.initState();
    _animalFlyweightFactory = AnimalFlyweightFactory();
    _buildAnimalList();
  }

  void _buildAnimalList() {
    _animalList = List<IAnimal>();
    for (var i = 0; i < AnimalFlyweightFactory.ANIMAL_COUNT; i++) {
      var shapeType = _getRandomAnimalType();
      var animal = _animalFlyweightFactory.getAnimal(shapeType);
      animal.setAge(_getRandomAnimalAge());
      animal.setBodyWeight(_getRandomAnimalBodyWeight());
      _animalList.add(animal);
    }
  }

  AnimalType _getRandomAnimalType() {
    var values = AnimalType.values;
    return values[Random().nextInt(values.length)];
  }

  String _getRandomAnimalAge() => Random().nextInt(20).toString();

  String _getRandomAnimalBodyWeight() => Random().nextInt(100).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FlutterFlyweightPatternDemo')),
        body: Center(
            child: ListView.builder(
                itemCount: _animalList.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: new BoxDecoration(color: Color(0xFFEDF259)),
                      child: ListTile(
                          leading: Icon(_animalList[index].getIconData(),
                              color: Color(0xFF0444BF)),
                          title: Text('${_animalList[index].getName()}'),
                          subtitle: Text(
                              '年齡: ${_animalList[index].getAge()}、'
                              '體重: ${_animalList[index].getBodyWeight()}',
                              style: TextStyle(color: Color(0xFF0AAFF1)))));
                })));
  }
}
