import 'Source.dart';

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "The Associated Press"
/// title : "A bus crashed near a ski resort in southern France killing 2 people and injuring at least 33"
/// description : "Local authorities say a bus has crashed near a ski resort in southern France, killing at least two people and injuring 33 others"
/// url : "https://abcnews.go.com/International/wireStory/bus-crashed-ski-resort-france-killing-2-people-116356319"
/// urlToImage : "https://s.abcnews.com/images/US/abc_news_default_2000x2000_update_16x9_992.jpg"
/// publishedAt : "2024-12-01T22:54:01Z"
/// content : "MADRID -- A bus crashed Sunday evening near a ski resort in the Pyrenees mountains in southern France, killing at least two people and injuring 33 others, local authorities said.\r\nA total of 47 peopl… [+1015 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}