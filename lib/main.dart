import 'package:flutter/material.dart';
import 'package:nigerian_ussd_codes/codeList.dart';
import 'package:nigerian_ussd_codes/ussdCode.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Nigerian Ussd Codes'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: ExactAssetImage('assets/mtn_logo.png'),
              ),
              text: 'Mtn',
            ),
            Tab(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: ExactAssetImage('assets/airtel_logo.png'),
              ),
              text: 'Airtel',
            ),
            Tab(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: ExactAssetImage('assets/nine_mobile_logo.png'),
              ),
              text: '9mobile',
            ),
            Tab(
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: ExactAssetImage('assets/glo_logo.png'),
              ),
              text: 'Glo',
            )
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Center(
            child: mtnListView(),
          ),
          Center(
            child: airtelListView(),
          ),
          Center(
            child: ninemobileListView(),
          ),
          Center(
            child: gloListView(),
          ),
        ],
      ),
    );
  }
}

class mtnListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = codeList.mtn;
    final subTitles = codeList.mtnUssdCode;

    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Card(
              //                           <-- Card widget
              child: ListTile(
                leading: Image.asset('assets/mtn_logo.png'),
                title: Text(titles[index]),
                subtitle: Text(subTitles[index]),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    launch("tel:$telToDial");
                    ;
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  launch("tel:$telToDial");
                },
              ),
            ),
          );
        });
  }
}

class airtelListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = codeList.airtelTitles;
    final subTitles = codeList.airtelUssd;

    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Card(
              //                           <-- Card widget
              child: ListTile(
                leading: Image.asset('assets/airtel_logo.png'),
                title: Text(titles[index]),
                subtitle: Text(subTitles[index]),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    launch("tel:$telToDial");
                    ;
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  launch("tel:$telToDial");
                },
              ),
            ),
          );
        });
  }
}

class ninemobileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = codeList.nineMobileTitles;
    final subTitles = codeList.ninmobileCodes;
    IconData logo = Icons.directions_bike;

    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Card(
              //                           <-- Card widget
              child: ListTile(
                leading: Image.asset('assets/nine_mobile_logo.png'),
                title: Text(titles[index]),
                subtitle: Text(subTitles[index]),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    launch("tel:$telToDial");
                    ;
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  launch("tel:$telToDial");
                },
              ),
            ),
          );
        });
  }
}

class gloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = codeList.gloTitles;
    final subTitles = codeList.gloUssdCodes;

    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Card(
              //                           <-- Card widget
              child: ListTile(
                leading: Image.asset('assets/glo_logo.png'),
                title: Text(titles[index]),
                subtitle: Text(subTitles[index]),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    launch("tel:$telToDial");
                    ;
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  launch("tel:$telToDial");
                },
              ),
            ),
          );
        });
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  ));
}
