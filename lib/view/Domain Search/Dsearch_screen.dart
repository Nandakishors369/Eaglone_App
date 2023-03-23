import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class DSearchScreen extends StatefulWidget {
  const DSearchScreen({super.key});

  @override
  State<DSearchScreen> createState() => _DSearchScreenState();
}

class _DSearchScreenState extends State<DSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheigh20,
            appHeadings(content: "Search Your Question"),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CupertinoSearchTextField(),
            ),
            kheight10,
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text("content"),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(),
                  );
                },
                itemCount: 15)
          ],
        ),
      )),
    );
  }
}
