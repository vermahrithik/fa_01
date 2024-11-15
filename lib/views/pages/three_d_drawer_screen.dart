import 'package:a/views/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';

class ThreeDDrawerAnimation extends StatelessWidget {
  const ThreeDDrawerAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyDrawer(
      drawer: Material(
        child: Container(
          color: const Color(0xff24283b),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 100, top: 100),
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              context.pop();
            },
          ),
          centerTitle: true,
          title: const Text('Drawer Animation'),
        ),
        body: Container(
          color: const Color(0xff414868),
        ),
      ),
    );
  }
}