import 'package:flutter/material.dart';
import 'package:transicion_app/pages/page2_page.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Text('Page 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () {
          Navigator.push(context, _createRoute());
        },
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context, 
        Animation<double> animation, 
        Animation<double> secondaryAnimation
      ) => Page2Page(),
      // transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (
        context, 
        animation, 
        secondaryAnimation, 
        child
      ) {
        final CurvedAnimation curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
