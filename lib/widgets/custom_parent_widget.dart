import 'package:flutter/material.dart';

class CustomParentWidget extends StatelessWidget {
  CustomParentWidget({this.child, Key? key}) : super(key: key);
  Widget? child;
  final GlobalKey<ScaffoldState> _mainDrawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    late MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return MediaQuery(data: queryData.copyWith(textScaleFactor: 1.0), child: child ?? SizedBox());
  }
}
