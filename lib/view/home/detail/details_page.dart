import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newland/core/data/models/post_data.dart';

class DetailsPage extends StatelessWidget {
  final PostData postData;

  const DetailsPage({Key? key, required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        // pinned: true,
        toolbarHeight: 60,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                padding: const EdgeInsets.only(left: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue)),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              padding: const EdgeInsets.only(right: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue)),
              child: const Center(
                child: Icon(
                  CupertinoIcons.bookmark_fill,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 5, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, -16),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
                //BoxShadow
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Text(
                  postData.categoryName!,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 20.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("${postData.image}")))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(child: Text("user name")),
                    Spacer(
                      flex: 1,
                    ),
                    Container(child: Text("${postData.postModified}")),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        expandedHeight: 360,
        flexibleSpace: FlexibleSpaceBar(
          background: CachedNetworkImage(
              imageUrl: "${postData.image}", fit: BoxFit.fill),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Text(postData.content!),
        ),
      )
    ])));
  }
}
