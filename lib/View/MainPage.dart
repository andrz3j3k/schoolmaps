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
  var selectSchoolObject = 1;

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
        leading: IconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.menu,
            size: 30,
            color: kolor,
          ),
          onPressed: () {
            if (kolor == Colors.white) {
              kolor = Colors.yellow;
            } else {
              kolor = Colors.white;
            }
            setState(() {});
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 450) {
            return Column(
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
                          nameObject: "Budynek na Dworskiego",
                          fc: () {
                            selectSchoolObject = schoolObject[0];
                            selectFloor = floor[0];
                            setState(() {});
                          },
                          color: changeColorObject(1),
                        ),
                      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListObjectInSchool(
                      nameObject: "Parter",
                      fc: () {
                        selectFloor = floor[0];
                        setState(() {});
                      },
                      color: changeColorFloor(10),
                    ),
                    ListObjectInSchool(
                      nameObject: "I",
                      fc: () {
                        selectFloor = floor[1];
                        setState(() {});
                      },
                      color: changeColorFloor(20),
                    ),
                    ListObjectInSchool(
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
                    ListObjectInSchool(
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
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    child: PinchZoom(
                      maxScale: 2.5,
                      resetDuration: const Duration(milliseconds: 200),
                      child:
                          Image.asset(changeObject(), height: double.infinity),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                  ),
                  child: const Text(
                    'Wybierz budynek',
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
                          nameObject: "Budynek na Dworskiego",
                          fc: () {
                            selectSchoolObject = schoolObject[0];
                            selectFloor = floor[0];
                            setState(() {});
                          },
                          color: changeColorObject(1),
                        ),
                      ),
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
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: const Text(
                    'Piętra:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 450,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListObjectInSchool(
                        nameObject: "Parter",
                        fc: () {
                          selectFloor = floor[0];
                          setState(() {});
                        },
                        color: changeColorFloor(10),
                      ),
                      ListObjectInSchool(
                        nameObject: "I",
                        fc: () {
                          selectFloor = floor[1];
                          setState(() {});
                        },
                        color: changeColorFloor(20),
                      ),
                      ListObjectInSchool(
                        nameObject: "II",
                        fc: selectSchoolObject != 1
                            ? () {
                                selectFloor = floor[2];
                                setState(() {});
                              }
                            : () {},
                        color: changeColorFloor(30),
                      ),
                      ListObjectInSchool(
                        nameObject: "III",
                        fc: selectSchoolObject != 1
                            ? () {
                                selectFloor = floor[3];
                                setState(() {});
                              }
                            : () {},
                        color: changeColorFloor(40),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: changeObject() == 'assets/mapaDworskiego.png' ||
                            changeObject() == 'assets/mapaDworskiego1.png'
                        ? Transform.rotate(
                            angle: 90 * pi / 180,
                            child: Transform.scale(
                              scale: 1.2,
                              child: PinchZoom(
                                maxScale: 2.5,
                                resetDuration:
                                    const Duration(milliseconds: 200),
                                child: Image.asset(changeObject(),
                                    height: double.infinity),
                              ),
                            ),
                          )
                        : PinchZoom(
                            maxScale: 2.5,
                            resetDuration: const Duration(milliseconds: 200),
                            child: Image.asset(changeObject(),
                                height: double.infinity),
                          ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
