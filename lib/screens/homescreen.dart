import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

List<Map<String, Object>> charitiesName = [
  {
    "value": 54.0,
    "name": "Doctors without Borders",
    "routeName": "/doctorsWithoutBorders",
    "color": "#FFA500",
    "percentageOfFirst": 0,
    "goals": 10000,
    "raised": 5400,
  },
  {
    "value": 20.0,
    "name": "American Red Cross",
    "routeName": "/americanRedCross",
    "color": "#A020F0",
    "percentageOfSecond": 0,
    "goals": 8000,
    "raised": 1600,
  },
  {
    "value": 95.0,
    "name": "The Nature Conservancy",
    "routeName": "/theNatureConservancy",
    "color": "#00FF00",
    "percentageOfThird": 0,
    "goals": 10000,
    "raised": 9500,
  },
  {
    "value": 41.0,
    "name": "Nature Resource Defence",
    "routeName": "/natureResourcesDefence",
    "color": "#FF0000",
    "percentageOfFourth": 0,
    "goals": 15000,
    "raised": 6150,
  }
];

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List subtitleInCard = ["Goals", "Raised"];
  List dataInSubtitle = ["goals", "raised"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              )),
          centerTitle: true,
          title: Text("Charities"),
        ),
        body: Container(
          child: ListView(
            children: charitiesName.map((e) {
              double a = e["value"] as double;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: e["color"].toString().toColor(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: ListTile(
                        leading: Icon(
                          Icons.abc,
                          size: 70,
                        ),
                        style: ListTileStyle.list,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 2, color: e["color"].toString().toColor()),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor: e["color"].toString().toColor(),
                        subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ...List.generate(2, (index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 4),
                                      child: Text(
                                          subtitleInCard[index].toString(),
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                      child: Text(
                                        "\$" +
                                            e[dataInSubtitle[index]].toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ]),
                        title: Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Text(
                            '${e["name"]}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        onTap: () => setState(() {
                          GoRouter.of(context).go("${e["routeName"]}");
                        }),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 280,
                            child: Slider(
                              inactiveColor: Colors.white,
                              value: e["value"] as double,
                              min: 0,
                              max: 100,
                              onChanged: (value) {
                                setState(() {
                                  e["value"] = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            a.toStringAsFixed(0) + "%",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


// Slider(
//                     inactiveColor: Colors.white,
//                     value: double.tryParse(e["value"].toString()) == null
//                         ? 0
//                         : double.parse(e["value"].toString()),
//                     min: 0,
//                     max: 100,
//                     onChanged: (value) {
//                       setState(() {});
//                     },
//                   ),