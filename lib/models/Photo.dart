class Item {
  List<Items>? items;

  Item({this.items});

  Item.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? innerType;
  Donut? donut;
  Comments? comments;
  int? markedAsAds;
  double? shortTextRate;
  String? hash;
  String? type;
  List<Attachments>? attachments;
  int? date;
  int? fromId;
  int? id;
  bool? isFavorite;
  Likes? likes;
  int? ownerId;
  PostSource? postSource;
  String? postType;
  Reposts? reposts;
  String? text;
  Views? views;
  int? carouselOffset;
  int? signerId;

  Items(
      {this.innerType,
      this.donut,
      this.comments,
      this.markedAsAds,
      this.shortTextRate,
      this.hash,
      this.type,
      this.attachments,
      this.date,
      this.fromId,
      this.id,
      this.isFavorite,
      this.likes,
      this.ownerId,
      this.postSource,
      this.postType,
      this.reposts,
      this.text,
      this.views,
      this.carouselOffset,
      this.signerId});

  Items.fromJson(Map<String, dynamic> json) {
    innerType = json['inner_type'];
    donut = json['donut'] != null ? new Donut.fromJson(json['donut']) : null;
    comments = json['comments'] != null
        ? new Comments.fromJson(json['comments'])
        : null;
    markedAsAds = json['marked_as_ads'];
    shortTextRate = json['short_text_rate'];
    hash = json['hash'];
    type = json['type'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    date = json['date'];
    fromId = json['from_id'];
    id = json['id'];
    isFavorite = json['is_favorite'];
    likes = json['likes'] != null ? new Likes.fromJson(json['likes']) : null;
    ownerId = json['owner_id'];
    postSource = json['post_source'] != null
        ? new PostSource.fromJson(json['post_source'])
        : null;
    postType = json['post_type'];
    reposts =
        json['reposts'] != null ? new Reposts.fromJson(json['reposts']) : null;
    text = json['text'];
    views = json['views'] != null ? new Views.fromJson(json['views']) : null;
    carouselOffset = json['carousel_offset'];
    signerId = json['signer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inner_type'] = this.innerType;
    if (this.donut != null) {
      data['donut'] = this.donut!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
    }
    data['marked_as_ads'] = this.markedAsAds;
    data['short_text_rate'] = this.shortTextRate;
    data['hash'] = this.hash;
    data['type'] = this.type;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['from_id'] = this.fromId;
    data['id'] = this.id;
    data['is_favorite'] = this.isFavorite;
    if (this.likes != null) {
      data['likes'] = this.likes!.toJson();
    }
    data['owner_id'] = this.ownerId;
    if (this.postSource != null) {
      data['post_source'] = this.postSource!.toJson();
    }
    data['post_type'] = this.postType;
    if (this.reposts != null) {
      data['reposts'] = this.reposts!.toJson();
    }
    data['text'] = this.text;
    if (this.views != null) {
      data['views'] = this.views!.toJson();
    }
    data['carousel_offset'] = this.carouselOffset;
    data['signer_id'] = this.signerId;
    return data;
  }
}

class Donut {
  bool? isDonut;

  Donut({this.isDonut});

  Donut.fromJson(Map<String, dynamic> json) {
    isDonut = json['is_donut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_donut'] = this.isDonut;
    return data;
  }
}

class Comments {
  int? canPost;
  int? count;
  bool? groupsCanPost;

  Comments({this.canPost, this.count, this.groupsCanPost});

  Comments.fromJson(Map<String, dynamic> json) {
    canPost = json['can_post'];
    count = json['count'];
    groupsCanPost = json['groups_can_post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['can_post'] = this.canPost;
    data['count'] = this.count;
    data['groups_can_post'] = this.groupsCanPost;
    return data;
  }
}

class Attachments {
  String? type;
  Video? video;
  Photo? photo;
  Link? link;

  Attachments({this.type, this.video, this.photo, this.link});

  Attachments.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.video != null) {
      data['video'] = this.video!.toJson();
    }
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    return data;
  }
}

class Video {
  String? responseType;
  int? canComment;
  int? canLike;
  int? canRepost;
  int? canSubscribe;
  int? canAddToFaves;
  int? canAdd;
  int? comments;
  int? date;
  String? description;
  int? duration;
  List<Image>? image;
  List<FirstFrame>? firstFrame;
  int? width;
  int? height;
  int? id;
  int? ownerId;
  String? title;
  bool? isFavorite;
  String? trackCode;
  int? repeat;
  String? type;
  int? views;
  int? localViews;
  int? canDislike;
  String? accessKey;
  Restriction? restriction;
  int? contentRestricted;

  Video(
      {this.responseType,
      this.canComment,
      this.canLike,
      this.canRepost,
      this.canSubscribe,
      this.canAddToFaves,
      this.canAdd,
      this.comments,
      this.date,
      this.description,
      this.duration,
      this.image,
      this.firstFrame,
      this.width,
      this.height,
      this.id,
      this.ownerId,
      this.title,
      this.isFavorite,
      this.trackCode,
      this.repeat,
      this.type,
      this.views,
      this.localViews,
      this.canDislike,
      this.accessKey,
      this.restriction,
      this.contentRestricted});

  Video.fromJson(Map<String, dynamic> json) {
    responseType = json['response_type'];
    canComment = json['can_comment'];
    canLike = json['can_like'];
    canRepost = json['can_repost'];
    canSubscribe = json['can_subscribe'];
    canAddToFaves = json['can_add_to_faves'];
    canAdd = json['can_add'];
    comments = json['comments'];
    date = json['date'];
    description = json['description'];
    duration = json['duration'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    if (json['first_frame'] != null) {
      firstFrame = <FirstFrame>[];
      json['first_frame'].forEach((v) {
        firstFrame!.add(new FirstFrame.fromJson(v));
      });
    }
    width = json['width'];
    height = json['height'];
    id = json['id'];
    ownerId = json['owner_id'];
    title = json['title'];
    isFavorite = json['is_favorite'];
    trackCode = json['track_code'];
    repeat = json['repeat'];
    type = json['type'];
    views = json['views'];
    localViews = json['local_views'];
    canDislike = json['can_dislike'];
    accessKey = json['access_key'];
    restriction = json['restriction'] != null
        ? new Restriction.fromJson(json['restriction'])
        : null;
    contentRestricted = json['content_restricted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_type'] = this.responseType;
    data['can_comment'] = this.canComment;
    data['can_like'] = this.canLike;
    data['can_repost'] = this.canRepost;
    data['can_subscribe'] = this.canSubscribe;
    data['can_add_to_faves'] = this.canAddToFaves;
    data['can_add'] = this.canAdd;
    data['comments'] = this.comments;
    data['date'] = this.date;
    data['description'] = this.description;
    data['duration'] = this.duration;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    if (this.firstFrame != null) {
      data['first_frame'] = this.firstFrame!.map((v) => v.toJson()).toList();
    }
    data['width'] = this.width;
    data['height'] = this.height;
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['title'] = this.title;
    data['is_favorite'] = this.isFavorite;
    data['track_code'] = this.trackCode;
    data['repeat'] = this.repeat;
    data['type'] = this.type;
    data['views'] = this.views;
    data['local_views'] = this.localViews;
    data['can_dislike'] = this.canDislike;
    data['access_key'] = this.accessKey;
    if (this.restriction != null) {
      data['restriction'] = this.restriction!.toJson();
    }
    data['content_restricted'] = this.contentRestricted;
    return data;
  }
}

class Image {
  String? url;
  int? width;
  int? height;
  int? withPadding;

  Image({this.url, this.width, this.height, this.withPadding});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    withPadding = json['with_padding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['with_padding'] = this.withPadding;
    return data;
  }
}

class FirstFrame {
  String? url;
  int? width;
  int? height;

  FirstFrame({this.url, this.width, this.height});

  FirstFrame.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Restriction {
  String? title;
  String? text;
  int? blur;
  int? canPlay;
  int? canPreview;
 
  int? disclaimerType;
 
  String? iconName;

  Restriction(
      {this.title,
      this.text,
      this.blur,
      this.canPlay,
      this.canPreview,
    
      this.disclaimerType,
    
      this.iconName});

  Restriction.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    blur = json['blur'];
    canPlay = json['can_play'];
    canPreview = json['can_preview'];
   
    disclaimerType = json['disclaimer_type'];
   
    iconName = json['icon_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['text'] = this.text;
    data['blur'] = this.blur;
    data['can_play'] = this.canPlay;
    data['can_preview'] = this.canPreview;
   
    data['disclaimer_type'] = this.disclaimerType;
   
    data['icon_name'] = this.iconName;
    return data;
  }
}

class Photo {
  int? albumId;
  int? date;
  int? id;
  int? ownerId;
  String? accessKey;
  int? postId;
  List<Sizes>? sizes;
  String? text;
  int? userId;
  String? webViewToken;
  bool? hasTags;
  double? lat;
  double? long;

  Photo(
      {this.albumId,
      this.date,
      this.id,
      this.ownerId,
      this.accessKey,
      this.postId,
      this.sizes,
      this.text,
      this.userId,
      this.webViewToken,
      this.hasTags,
      this.lat,
      this.long});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['album_id'];
    date = json['date'];
    id = json['id'];
    ownerId = json['owner_id'];
    accessKey = json['access_key'];
    postId = json['post_id'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
    text = json['text'];
    userId = json['user_id'];
    webViewToken = json['web_view_token'];
    hasTags = json['has_tags'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_id'] = this.albumId;
    data['date'] = this.date;
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
   
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    data['user_id'] = this.userId;
    data['web_view_token'] = this.webViewToken;
    data['has_tags'] = this.hasTags;
    
    return data;
  }
}

class Sizes {
  int? height;
  String? type;
  int? width;
  String? url;

  Sizes({this.height, this.type, this.width, this.url});

  Sizes.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    type = json['type'];
    width = json['width'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['type'] = this.type;
    data['width'] = this.width;
    data['url'] = this.url;
    return data;
  }
}

class Link {
  String? url;
  String? caption;
  String? description;
  Photo? photo;
  String? title;

  Link({this.url, this.caption, this.description, this.photo, this.title});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    caption = json['caption'];
    description = json['description'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['caption'] = this.caption;
    data['description'] = this.description;
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}


class Likes {
  int? canLike;
  int? count;
  int? userLikes;
  int? canPublish;
  bool? repostDisabled;

  Likes(
      {this.canLike,
      this.count,
      this.userLikes,
      this.canPublish,
      this.repostDisabled});

  Likes.fromJson(Map<String, dynamic> json) {
    canLike = json['can_like'];
    count = json['count'];
    userLikes = json['user_likes'];
    canPublish = json['can_publish'];
    repostDisabled = json['repost_disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['can_like'] = this.canLike;
    data['count'] = this.count;
    data['user_likes'] = this.userLikes;
    data['can_publish'] = this.canPublish;
    data['repost_disabled'] = this.repostDisabled;
    return data;
  }
}

class PostSource {
  String? type;

  PostSource({this.type});

  PostSource.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}

class Reposts {
  int? count;
  int? userReposted;

  Reposts({this.count, this.userReposted});

  Reposts.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    userReposted = json['user_reposted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['user_reposted'] = this.userReposted;
    return data;
  }
}

class Views {
  int? count;

  Views({this.count});

  Views.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}