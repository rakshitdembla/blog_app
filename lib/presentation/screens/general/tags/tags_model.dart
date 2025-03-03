import 'dart:convert';

TagModel tagmodelfromjson(String jsondata) => TagModel.fromjson(jsonDecode(
    jsondata)); // function to decode jsondata using tagmodel.fromjson , whch i have to do everywhere now done by this single function
String tagmodeltojson(TagModel yourdata) => jsonEncode(yourdata
    .tojson()); //a function that just encode data to json by using to.json takes TagModel in para

Tag tagfromjson(String jsondata) => Tag.fromjson(jsonDecode(jsondata));
String tagtomap(Tag yourdata) => jsonEncode(yourdata.tojson());

class TagModel {
  int? status;
  int? tags_count;
  List<Tag>? tags;

  TagModel({this.status, this.tags_count, this.tags});

  factory TagModel.fromjson(Map<String, dynamic> json) {
    return TagModel(
        status: json["status"],
        tags_count: json["tags_count"],
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]
                .map((x) => Tag.fromjson(x))
                .toList())); //we want a list of <tag> type fron list type of json which contain map of all tags so what we do take a list List<Tag> from List<json>.map go on each element (x) represents each element Tag.fromjson(x each element) tag.from json converts map to tag model remember so i takes each elemnt of json list (x) and convert each map of tag in each tag type model

    //.map i used to modify ech elemnt of list e.g (x) => x*2, go on each elemt and fcuk him up
  }

  Map<String, dynamic> tojson() {
    return {
      "status": status,
      "tags_count": tags_count,
      "tags":
          tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.tojson()))
      // opposite here dart tag type list to json, same method here new list of dynamic .from tags list tags.map go on each element => each element tp json x.tojson tojson is tag method whch will convert tag model to map remember! and all set, we finally converted List<Tag> type to List<json> type represented as List<dynamic>
    };
  }
}

class Tag {
  int? id;
  String? title;
  String? slug;
  DateTime? created_at;
  DateTime? updated_at;

  Tag({this.id, this.slug, this.title, this.created_at, this.updated_at});

  factory Tag.fromjson(Map<String, dynamic> json) {
    return Tag(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        created_at: DateTime.parse(json["created_at"]),
        updated_at: DateTime.parse(json["updated_at"]));
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "slug": slug,
      "title": title,
      "created_at": created_at?.toIso8601String(),
      "updated_at": updated_at?.toIso8601String()
    };
  }
}
