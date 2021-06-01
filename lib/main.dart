import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nigerian_ussd_codes/codeList.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:io';

import 'ad_helper.dart';

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
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  // TODO: Add _bannerAd
  BannerAd _bannerAd;
  BannerAd _bannerAd2;
  BannerAd _bannerAd3;
  BannerAd _bannerAd4;

// TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  bool _isBannerAdReady2 = false;
  bool _isBannerAdReady3 = false;
  bool _isBannerAdReady4 = false;

  @override
  void initState() {
    super.initState();
    // Load ads.
    print('initstate called');
    MobileAds.instance.initialize();

    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();




    _bannerAd2 = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady2 = true;
            print('banner 2 loaded');
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady2 = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd2.load();

    _bannerAd3 = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady3 = true;
            print('banner 3 loaded');
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady3 = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd3.load();

     _bannerAd4 = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady4 = true;
            print('banner 4 loaded');
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady4 = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd4.load();

  }

  @override
  Widget build(BuildContext context) {
    print('build called');

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
      body: FutureBuilder<void>(
          future: _initGoogleMobileAds(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            return TabBarView(
              children: [
                Center(
                  child: Column(
                    children: [
                      if (_isBannerAdReady)
                      showBannerAds(
                          height: _bannerAd.size.height.toDouble(),
                          width: _bannerAd.size.width.toDouble(),
                          bannerAd: _bannerAd),
                      Expanded(child: mtnListView()),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      if (_isBannerAdReady2)
                      showBannerAds(
                          height: _bannerAd2.size.height.toDouble(),
                          width: _bannerAd2.size.width.toDouble(),
                          bannerAd: _bannerAd2),
                      Expanded(child: airtelListView()),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      if (_isBannerAdReady3)
                      showBannerAds(
                          height: _bannerAd3.size.height.toDouble(),
                          width: _bannerAd3.size.width.toDouble(),
                          bannerAd: _bannerAd3),
                      Expanded(child: ninemobileListView()),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [  if (_isBannerAdReady4)
                      showBannerAds(
                          height: _bannerAd4.size.height.toDouble(),
                          width: _bannerAd4.size.width.toDouble(),
                          bannerAd: _bannerAd4),
                      Expanded(child: gloListView()),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}

class showBannerAds extends StatelessWidget {
  final double width;
  final double height;
  final BannerAd bannerAd;

  const showBannerAds({Key key, this.width, this.height, this.bannerAd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width,
        height: height,
        child: AdWidget(ad: bannerAd),
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
                subtitle: Container(
                  child: Text(
                    subTitles[index],
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 18,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    telToDial = telToDial.substring(0, telToDial.length - 1);
                    launchURL("tel:$telToDial" + "%23");
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  telToDial = telToDial.substring(0, telToDial.length - 1);
                  launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
                },
              ),
            ),
          );
        });
  }
}

void launchURL(String telToDial) async {
  print(telToDial);
  await canLaunch(telToDial)
      ? await launch(telToDial)
      : throw 'Could not launch $telToDial';
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
                subtitle: Container(
                  child: Text(
                    subTitles[index],
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    telToDial = telToDial.substring(0, telToDial.length - 1);
                    launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
                    ;
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  telToDial = telToDial.substring(0, telToDial.length - 1);
                  launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
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
                subtitle: Container(
                  child: Text(
                    subTitles[index],
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    telToDial = telToDial.substring(0, telToDial.length - 1);
                    launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
                    ;
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  telToDial = telToDial.substring(0, telToDial.length - 1);
                  launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
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
                subtitle: Container(
                  child: Text(
                    subTitles[index],
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
                trailing: OutlinedButton(
                  child: Text('Dial'),
                  style: OutlinedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    var telToDial = subTitles[index];
                    telToDial = telToDial.substring(0, telToDial.length - 1);
                    launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
                  },
                ),
                onTap: () {
                  var telToDial = subTitles[index];
                  telToDial = telToDial.substring(0, telToDial.length - 1);
                  launchURL("tel:$telToDial" + Uri.encodeComponent("#"));
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
