import 'package:eaglone/Repositories/news_services.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:lottie/lottie.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  /* getnewsData() async {
    final result = await getNewsData();
    log(result.title);
  } */
  refreshh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CupertinoScrollbar(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              kheigh20,
              Row(
                children: [
                  kwidth15,
                  appHeadings(content: "Top Tech News"),
                ],
              ),
              kheigh20,
              Visibility(
                /* visible: isLoaded,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ), */
                child: FutureBuilder(
                    future: getNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return AnimationLimiter(
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                String? imageUrl = snapshot
                                    .data!.articles![index].urlToImage
                                    .toString();
                                //Newsdata();
                                if (snapshot
                                        .data!.articles![index].urlToImage ==
                                    null) {
                                  imageUrl =
                                      "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
                                }
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  delay: Duration(milliseconds: 100),
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 2500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    horizontalOffset: 30,
                                    verticalOffset: 300.0,
                                    child: FlipAnimation(
                                      duration: Duration(milliseconds: 3000),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      flipAxis: FlipAxis.y,
                                      child: newsCard(
                                          imageUrl,
                                          snapshot.data!.articles![index].title
                                              .toString(),
                                          snapshot.data!.articles![index].url
                                              .toString()),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                              itemCount: 20),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Lottie.asset("assets/errorLottie.json"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CupertinoActivityIndicator(
                            color: kblack,
                          ),
                        );
                      } else {
                        return Center(
                            child: Lottie.asset("assets/eaglone_loading.json"));
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding newsCard(String? newsImage, String newsTitle, String url) {
    String imageLink =
        "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SizedBox(
          width: 400.w,
          height: 350.h,
          child: Link(
            target: LinkTarget.self,
            uri: Uri.parse('google.com'),
            builder: (context, followLink) => GestureDetector(
              onTap: () async {
                await _launchUrl(url: Uri.parse(url));
              },
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Image.network(
                      newsImage.toString(),
                      fit: BoxFit.cover,
                      height: 200.h,
                      width: 400.w,
                    ),
                    kheigh20,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: newsHeadings(content: newsTitle),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

/*   Newsdata() async {
    final _result = await getNewsData();
    log(_result.title);
  } */
}

Future<void> _launchUrl({
  required url,
}) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
