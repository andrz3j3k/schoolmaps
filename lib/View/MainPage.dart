import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'ButtonListObject.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Color kolor = Colors.white;
  var floor = [10, 20, 30, 40];
  var schoolObject = [1, 2];

  var selectFloor = 10;
  var selectSchoolObject = 2;

  changeObject() {
    switch (selectSchoolObject + selectFloor) {
      case 11:
        return 'assets/mapaDworskiego.png';
      case 21:
        return 'assets/mapaDworskiego1.png';
      case 12:
        return 'assets/mapaKilinskiego.png';
      case 22:
        return 'assets/mapaKilinskiego1.png';
      case 32:
        return 'assets/mapaKilinskiego2.png';
      case 42:
        return 'assets/mapaKilinskiego3.png';
    }
  }

  changeColorFloor(liczba) {
    if (selectFloor == liczba) {
      switch (liczba) {
        case 10:
          return Colors.amber;
        case 20:
          return Colors.amber;
        case 30:
          return Colors.amber;
        case 40:
          return Colors.amber;
      }
    } else {
      return Colors.grey;
    }
  }

  changeColorObject(liczba) {
    if (selectSchoolObject == liczba) {
      switch (liczba) {
        case 1:
          return Colors.amber;
        case 2:
          return Colors.amber;
      }
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 10,
        title: const Text(
          'Mapa ZSEIO',
        ),
        titleTextStyle: const TextStyle(fontSize: 30, color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sentiment_satisfied_outlined),
            tooltip: 'Autorzy',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Autorzy: Dominik Gąsior, Mateusz Bojarski dla ZSEIO Przemyśl :)'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 25),
            child: const Text(
              'Wybierz budynek:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 450,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListObjectInSchool(
                    nameObject: "Budynek na Kilińskiego",
                    fc: () {
                      selectSchoolObject = schoolObject[1];
                      selectFloor = floor[0];
                      setState(() {});
                    },
                    color: changeColorObject(2),
                  ),
                ),
                Expanded(
                  child: ListObjectInSchool(
                    nameObject: "Budynek na Dworskiego",
                    fc: () {
                      selectSchoolObject = schoolObject[0];
                      selectFloor = floor[0];
                      setState(() {});
                    },
                    color: changeColorObject(1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 15),
            child: const Text(
              'Piętra:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 400,
            child: selectSchoolObject != 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListObjectInSchool(
                          nameObject: "Parter",
                          fc: () {
                            selectFloor = floor[0];
                            setState(() {});
                          },
                          color: changeColorFloor(10),
                        ),
                      ),
                      Expanded(
                        child: ListObjectInSchool(
                          nameObject: "I",
                          fc: () {
                            selectFloor = floor[1];
                            setState(() {});
                          },
                          color: changeColorFloor(20),
                        ),
                      ),
                      Expanded(
                        child: ListObjectInSchool(
                          nameObject: "II",
                          fc: selectSchoolObject != 1
                              ? () {
                                  selectFloor = floor[2];
                                  setState(() {});
                                }
                              : () {
                                  setState(() {});
                                },
                          color: changeColorFloor(30),
                        ),
                      ),
                      Expanded(
                        child: ListObjectInSchool(
                          nameObject: "III",
                          fc: selectSchoolObject != 1
                              ? () {
                                  selectFloor = floor[3];
                                  setState(() {});
                                }
                              : () {
                                  setState(() {});
                                },
                          color: changeColorFloor(40),
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListObjectInSchool(
                          nameObject: "Parter",
                          fc: () {
                            selectFloor = floor[0];
                            setState(() {});
                          },
                          color: changeColorFloor(10),
                        ),
                      ),
                      Expanded(
                        child: ListObjectInSchool(
                          nameObject: "I",
                          fc: () {
                            selectFloor = floor[1];
                            setState(() {});
                          },
                          color: changeColorFloor(20),
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: PinchZoom(
                maxScale: 2.5,
                resetDuration: const Duration(milliseconds: 1000),
                child: Image.asset(changeObject(), height: double.infinity),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
