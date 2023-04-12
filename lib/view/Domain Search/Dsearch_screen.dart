import 'package:eaglone/Repositories/free_courses.dart';
import 'package:eaglone/view/Home%20Screen/your_courses.dart';
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
  FreeCourses freeCourses = FreeCourses();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheigh20,
              appHeadings(content: "Your Free Courses"),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CupertinoSearchTextField(),
              ),
              kheight10,
              FutureBuilder(
                future: freeCourses.getProducts(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingGrid();
                  } else if (snapshot.hasData && snapshot.data != null) {
                    var data = snapshot.data!;
                    return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: kwhite,
                              backgroundImage:
                                  NetworkImage(data.data[index].image),
                            ),
                            title: Text(data.data[index].title),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(),
                          );
                        },
                        itemCount: data.data.length);
                  } else {
                    return Center(
                      child: Text("Something Went Wrong"),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
