import 'package:flutter/material.dart';
import 'package:newland/core/data/api/news_api.dart';
import 'package:newland/core/data/models/category_data.dart';
import 'package:newland/core/data/models/post_data.dart';
import 'package:newland/di/database_module.dart';
import 'package:newland/view/home/components/news_item.dart';

class PostItem extends StatefulWidget {
  final Category category;

  const PostItem({Key? key, required this.category}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  List<PostData> posts = [];

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  Future<void> getAllPosts() async {
    var result = await getIt
        .get<NewsApi>()
        .getAllPosts(categoryId: widget.category.id ?? 0);
    result
        .onSuccess((p0) {
          posts = p0.toList();
          setState(() {});
        })
        .onMessage((p0) {})
        .onError((p0) {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) => NewsItem(postData: posts[index]));
  }
}
