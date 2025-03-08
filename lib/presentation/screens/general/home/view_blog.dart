
import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../core/constants/my_colors.dart';

@RoutePage()
class ViewBlog extends StatefulWidget {
  final BlogPost blogpost;
  const ViewBlog({super.key, required this.blogpost});

  @override
  State<ViewBlog> createState() => _ViewBlogState();
}

class _ViewBlogState extends State<ViewBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primarycolor,
        iconTheme: IconThemeData(color: MyColors.whitecolor),
        centerTitle: true,
        title: Text(
          widget.blogpost.title ?? "No title",
          style: TextStyle(
              color: MyColors.whitecolor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.blogpost.id.toString(),
              child: CachedNetworkImage(
                imageUrl: widget.blogpost.featuredimage.toString(),
                height: 250,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) {
                  return Center(
                    child: Icon(Icons.error),
                  );
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.blogpost.title ?? "No title",
                    style: TextStyle(
                        color: MyColors.blacktextcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        FeatherIcons.eye,
                        size: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.blogpost.views == null
                            ? "0 Views"
                            : "${widget.blogpost.views} Views",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                        size: 20,
                      ),
                      Text(widget.blogpost.like == null
                          ? "0"
                          : widget.blogpost.like.toString()),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                        size: 20,
                      ),
                      Text(widget.blogpost.dislike == null
                          ? "0"
                          : widget.blogpost.dislike.toString()),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  HtmlWidget(widget.blogpost.body.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
