import 'dart:math';

import 'package:charityapp/dto/appProviders.dart';
import 'package:charityapp/widgets/circlenumber.dart';
import 'package:charityapp/widgets/circleselectnumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NatureResourcesDefence extends ConsumerStatefulWidget {
  const NatureResourcesDefence({super.key});

  @override
  ConsumerState<NatureResourcesDefence> createState() =>
      _NatureResourcesDefenceState();
}

class _NatureResourcesDefenceState
    extends ConsumerState<NatureResourcesDefence> {
  List<int> b = [];
  int _randomNumber1 = 0;
  int _randomNumber2 = 0;
  int _randomNumber3 = 0;
  int _randomNumber4 = 0;
  int _randomNumber5 = 0;
  List list = [];
  void generateRandomNumber() {
    // create a list say of 16 numbers.
    list = List.generate(36, (i) => i + 1);

// shuffle it
    list.shuffle();
  }

  Color white = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Play"),
          leading: Padding(
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    GoRouter.of(context).go("/");
                  });
                },
              )),
          actions: [
            Padding(
                padding: EdgeInsets.all(5),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    GoRouter.of(context).go("/cart");
                  },
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.grey[200],
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      child: Text(
                        "Pick your 5 numbers",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Circle(
                          colorScheme: white,
                          num: _randomNumber1,
                        ),
                        Circle(
                          colorScheme: white,
                          num: _randomNumber2,
                        ),
                        Circle(
                          colorScheme: white,
                          num: _randomNumber3,
                        ),
                        Circle(
                          colorScheme: white,
                          num: _randomNumber4,
                        ),
                        Circle(
                          colorScheme: white,
                          num: _randomNumber5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.replay),
                            onPressed: () {
                              generateRandomNumber();
                              setState(() {
                                _randomNumber1 = list[0];
                                _randomNumber2 = list[1];
                                _randomNumber3 = list[2];
                                _randomNumber4 = list[3];
                                _randomNumber5 = list[4];
                              });
                              b = <int>[
                                _randomNumber1,
                                _randomNumber2,
                                _randomNumber3,
                                _randomNumber4,
                                _randomNumber5
                              ];

                              ref.watch(dataStateProvider4.notifier).addData(b);

                              Future.delayed(Duration(milliseconds: 4), (() {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Container(
                                          height: 350,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              FlutterLogo(
                                                size: 100,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Ticket added in your cart",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "You can check your ticket here",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.blue,
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      "Purchase Another Ticket"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.blue,
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    GoRouter.of(context)
                                                        .go("/cart");
                                                  },
                                                  child: Text("Checkout"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: (() {
                              setState(() {
                                a = [];
                                c = Colors.white;
                              });
                            }),
                            child: Text("Clear"),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              if (a.length == 5) {
                                ref
                                    .watch(dataStateProvider4.notifier)
                                    .addData(a);
                                setState(() {
                                  a = [];
                                  c = Colors.white;
                                });
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Container(
                                          height: 350,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              FlutterLogo(
                                                size: 100,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Ticket added in your cart",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "You can check your ticket here",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.blue,
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                      "Purchase Another Ticket"),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.blue,
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.blue),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    GoRouter.of(context)
                                                        .go("/cart");
                                                  },
                                                  child: Text("Checkout"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              } else {}
                            },
                            child: Text("Add to cart"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    runSpacing: 5,
                    children: [
                      ...List.generate(
                          36, (index) => CircleToSelect(num: index + 1))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<int> a = [];
Color c = Colors.white;

class CircleToSelect extends StatefulWidget {
  const CircleToSelect({super.key, required this.num});

  final int num;

  @override
  State<CircleToSelect> createState() => _CircleToSelectState();
}

class _CircleToSelectState extends State<CircleToSelect> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (a.length < 5) {
          setState(() {
            c = Colors.blue;
          });
          if (!a.contains(widget.num)) {
            a.add(widget.num);
          }
        }
      },
      child: AnimatedContainer(
        height: 35,
        width: 50,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            widget.num.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
