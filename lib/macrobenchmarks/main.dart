import 'package:flutter/material.dart';
import 'src/picture_cache.dart';
import 'src/backdrop_filter.dart';

import 'common.dart';

const String kMacrobenchmarks = 'Macrobenchmarks';

class MacrobenchmarksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kMacrobenchmarks,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        kCullOpacityRouteName: (BuildContext context) => CullOpacityPage(),
        kCubicBezierRouteName: (BuildContext context) => CubicBezierPage(),
        kBackdropFilterRouteName: (BuildContext context) => BackdropFilterPage(),
        kSimpleAnimationRouteName: (BuildContext conttext) => SimpleAnimationPage(),
        kPictureCacheRouteName: (BuildContext conttext) => PictureCachePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(kMacrobenchmarks)),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            key: const Key(kCullOpacityRouteName),
            child: const Text('Cull opacity'),
            onPressed: () {
              Navigator.pushNamed(context, kCullOpacityRouteName);
            },
          ),
          RaisedButton(
            key: const Key(kCubicBezierRouteName),
            child: const Text('Cubic Bezier'),
            onPressed: () {
              Navigator.pushNamed(context, kCubicBezierRouteName);
            },
          ),
          RaisedButton(
            key: const Key(kBackdropFilterRouteName),
            child: const Text('Backdrop Filter'),
            onPressed: () {
              Navigator.pushNamed(context, kBackdropFilterRouteName);
            },
          ),
          RaisedButton(
            key: const Key(kSimpleAnimationRouteName),
            child: const Text('Simple Animation'),
            onPressed: () {
              Navigator.pushNamed(context, kSimpleAnimationRouteName);
            },
          ),
          RaisedButton(
            key: const Key(kPictureCacheRouteName),
            child: const Text('Picture Cache'),
            onPressed: () {
              Navigator.pushNamed(context, kPictureCacheRouteName);
            },
          ),
        ],
      ),
    );
  }
}
