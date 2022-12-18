import 'package:charityapp/dto/appProviders.dart';
import 'package:charityapp/widgets/circlenumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

List<Map<String, Object>> charitiesName = [
  {"name": "Doctors without Borders", "provider": dataStateProvider1.notifier},
  {"name": "American Red Cross", "provider": dataStateProvider2.notifier},
  {"name": "The Nature Conservancy", "provider": dataStateProvider3.notifier},
  {"name": "Nature Resource Defence", "provider": dataStateProvider4.notifier}
];

class Cart extends ConsumerStatefulWidget {
  const Cart({
    super.key,
  });

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  Color grey = Colors.grey.shade200;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    int data1 = ref.watch(dataStateProvider1.notifier).completeData.length;
    int data2 = ref.watch(dataStateProvider2.notifier).completeData.length;
    int data3 = ref.watch(dataStateProvider3.notifier).completeData.length;
    int data4 = ref.watch(dataStateProvider4.notifier).completeData.length;
    int sum = data1 + data2 + data3 + data4;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text("Total"),
                  subtitle: Text("\$" + "$sum"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Buy Tickets",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Order Summary"),
          leading: Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              )),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 73, 116, 180),
              width: double.infinity,
              child: Text(
                "Jackpot: 100,000,0000T,  Next Draw: Jan 21 10:00PM",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(3),
                child: ListView(
                  children: charitiesName.map((e) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      borderOnForeground: true,
                      color: Colors.white,
                      child: Container(
                        child: ExpansionTile(
                          title: Text(
                            "Charity Donation",
                          ),
                          textColor: Colors.black,
                          children: [
                            Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.abc,
                                    size: 70,
                                  ),
                                  style: ListTileStyle.list,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Text("Entries: " +
                                        ref
                                            .watch(e["provider"]
                                                as ProviderListenable)
                                            .completeData
                                            .length
                                            .toString()),
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Text(
                                      e["name"].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: (() {}),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            "Your tickets: " +
                                                ref
                                                    .watch(e["provider"]
                                                        as ProviderListenable)
                                                    .completeData
                                                    .length
                                                    .toString(),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: TextButton(
                                          onPressed: (() {}),
                                          child: Text("Add Ticket+"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 100,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ...List.generate(
                                          ref
                                              .watch(e["provider"]
                                                  as ProviderListenable)
                                              .completeData
                                              .length,
                                          ((newindex) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      2, 0, 2, 4),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(3, 0, 10, 0),
                                                    child: Text(
                                                      "${newindex + 1}.",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  ...List.generate(5, (index) {
                                                    return Circle(
                                                        colorScheme: grey,
                                                        num: ref
                                                                .watch(e[
                                                                        "provider"]
                                                                    as ProviderListenable)
                                                                .completeData[
                                                            newindex][index]);
                                                  }),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 0),
                                                    child: IconButton(
                                                      icon: Icon(Icons.delete),
                                                      onPressed: () {
                                                        ref
                                                            .watch(e["provider"]
                                                                as ProviderListenable)
                                                            .removeData(
                                                                newindex);
                                                        setState(() {});
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
