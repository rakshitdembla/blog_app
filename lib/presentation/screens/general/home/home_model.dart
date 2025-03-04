class BlogResponse {
  final int? status;
  final List<BlogPost>? all_posts;

  BlogResponse({
    this.status,
    this.all_posts,
  });

  factory BlogResponse.fromJson(Map<String, dynamic> json) {
    return BlogResponse(
      status: json['status'],
      all_posts : json["all_posts"] == null ? [] : List<BlogPost>.from(json['all_posts'].map((x) => BlogPost.fromJson(x)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'all_posts': all_posts == null ? [] : List<dynamic>.from(all_posts!.map((x) => x.toJson()).toList()),
    };
  }
}


class BlogPost {
  final int? id;
  final String? name;
  final String? email;
  final String? profile_photo_path;
  final String? about;
  final String? created_at;
  final String? updated_at;
  final int? user_id;
  final String? title;
  final String? slug;
  final String? featuredimage;
  final String? body;
  final int? status;
  final int? like;
  final int? dislike;
  final int? views;
  final String? profile_photo_url;

  BlogPost({
    this.id,
    this.name,
    this.email,
    this.profile_photo_path,
    this.about,
    this.created_at,
    this.updated_at,
    this.user_id,
    this.title,
    this.slug,
    this.featuredimage,
    this.body,
    this.status,
    this.like,
    this.dislike,
    this.views,
    this.profile_photo_url,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profile_photo_path: json['profile_photo_path'],
      about: json['about'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      user_id: json['user_id'],
      title: json['title'],
      slug: json['slug'],
      featuredimage: json['featuredimage'],
      body: json['body'],
      status: json['status'],
      like: json['like'] ?? 0,
      dislike: json['dislike'] ?? 0,
      views: json['views'],
      profile_photo_url: json['profile_photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_photo_path': profile_photo_path,
      'about': about,
      'created_at': created_at,
      'updated_at': updated_at,
      'user_id': user_id,
      'title': title,
      'slug': slug,
      'featuredimage': featuredimage,
      'body': body,
      'status': status,
      'like': like,
      'dislike': dislike,
      'views': views,
      'profile_photo_url': profile_photo_url,
    };
  }
}

