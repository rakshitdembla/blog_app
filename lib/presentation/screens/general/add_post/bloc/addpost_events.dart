import 'dart:io';

abstract class AddpostEvents {}

class AddPostSubmit extends AddpostEvents {
  final String? title;
  final String? slug;
  final int? tagid;
  final int? categoryid;
  final dynamic body;
  final int? status;
  final int? userid;
  final File? featuredimage;

  AddPostSubmit(
      {this.title,
      this.slug,
      this.tagid,
      this.categoryid,
      this.body,
      this.status,
      this.userid,
      this.featuredimage});
}
