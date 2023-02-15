class PostData {
  int? id;
  String? title;
  String? excerpt;
  String? content;
  int? publishedAt;
  int? updatedAt;
  String? postId;
  String? postModified;
  int? categoryId;
  String? categoryName;
  String? image;
  String? url;
  String? priority;
  String? order;

  PostData(
      {this.id,
      this.title,
      this.excerpt,
      this.content,
      this.publishedAt,
      this.updatedAt,
      this.postId,
      this.postModified,
      this.categoryId,
      this.categoryName,
      this.image,
      this.url,
      this.priority,
      this.order});

  PostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    excerpt = json['excerpt'];
    content = json['content'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    postId = json['post_id'];
    postModified = json['post_modified'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    image = json['image'];
    url = json['url'];
    priority = json['priority'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['excerpt'] = excerpt;
    data['content'] = content;
    data['published_at'] = publishedAt;
    data['updated_at'] = updatedAt;
    data['post_id'] = postId;
    data['post_modified'] = postModified;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['image'] = image;
    data['url'] = url;
    data['priority'] = priority;
    data['order'] = order;
    return data;
  }
}
