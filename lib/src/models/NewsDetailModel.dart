class NewsDetailModel {
  int id;
  String judul;
  String isi;
  String tipe;
  int kategoriId;
  int createdBy;
  String uploadItem;
  int isApproved;
  int like;
  int view;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String thumbnail;
  int parentId;
  String liveStreamKey;
  int isEdited;
  int approvedBy;
  String version;
  String slug;
  String dateCreated;
  String timeCreated;
  String rssDate;
  String uploadItemReal;
  String thumbnailReal;
  Category category;
  User user;
  List<BeritaMedia> beritaMedia;
  List<Comment> comment;

  NewsDetailModel(
      {this.id,
        this.judul,
        this.isi,
        this.tipe,
        this.kategoriId,
        this.createdBy,
        this.uploadItem,
        this.isApproved,
        this.like,
        this.view,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.thumbnail,
        this.parentId,
        this.liveStreamKey,
        this.isEdited,
        this.approvedBy,
        this.version,
        this.slug,
        this.dateCreated,
        this.timeCreated,
        this.rssDate,
        this.uploadItemReal,
        this.thumbnailReal,
        this.category,
        this.user,
        this.beritaMedia,
        this.comment});

  NewsDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    isi = json['isi'];
    tipe = json['tipe'];
    kategoriId = json['kategori_id'];
    createdBy = json['created_by'];
    uploadItem = json['upload_item'];
    isApproved = json['is_approved'];
    like = json['like'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    thumbnail = json['thumbnail'];
    parentId = json['parent_id'];
    liveStreamKey = json['live_stream_key'];
    isEdited = json['is_edited'];
    approvedBy = json['approved_by'];
    version = json['version'];
    slug = json['slug'];
    dateCreated = json['date_created'];
    timeCreated = json['time_created'];
    rssDate = json['rss_date'];
    uploadItemReal = json['upload_item_real'];
    thumbnailReal = json['thumbnail_real'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['berita_media'] != null) {
      beritaMedia = new List<BeritaMedia>();
      json['berita_media'].forEach((v) {
        beritaMedia.add(new BeritaMedia.fromJson(v));
      });
    }
    if (json['comment'] != null) {
      comment = new List<Comment>();
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['isi'] = this.isi;
    data['tipe'] = this.tipe;
    data['kategori_id'] = this.kategoriId;
    data['created_by'] = this.createdBy;
    data['upload_item'] = this.uploadItem;
    data['is_approved'] = this.isApproved;
    data['like'] = this.like;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['thumbnail'] = this.thumbnail;
    data['parent_id'] = this.parentId;
    data['live_stream_key'] = this.liveStreamKey;
    data['is_edited'] = this.isEdited;
    data['approved_by'] = this.approvedBy;
    data['version'] = this.version;
    data['slug'] = this.slug;
    data['date_created'] = this.dateCreated;
    data['time_created'] = this.timeCreated;
    data['rss_date'] = this.rssDate;
    data['upload_item_real'] = this.uploadItemReal;
    data['thumbnail_real'] = this.thumbnailReal;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.beritaMedia != null) {
      data['berita_media'] = this.beritaMedia.map((v) => v.toJson()).toList();
    }
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int id;
  String nama;
  String createdAt;
  String updatedAt;
  String thumbnail;

  Category(
      {this.id, this.nama, this.createdAt, this.updatedAt, this.thumbnail});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class User {
  int id;
  String email;
  String username;
  String firstName;
  String lastName;
  String alamat;
  String phoneNumber;
  String profilePic;
  int gender;
  String birthdate;
  String aboutMe;
  String facebookId;
  Null twitterId;
  int point;
  int isLive;
  int followers;
  String createdAt;
  String updatedAt;
  int firstLogin;
  int following;
  int isVerified;
  Null deletedAt;
  String twitterToken;
  int award;
  String socialPassword;
  String onesignalIdMobile;
  Null onesignalIdWeb;
  String profilePicRealPath;

  User(
      {this.id,
        this.email,
        this.username,
        this.firstName,
        this.lastName,
        this.alamat,
        this.phoneNumber,
        this.profilePic,
        this.gender,
        this.birthdate,
        this.aboutMe,
        this.facebookId,
        this.twitterId,
        this.point,
        this.isLive,
        this.followers,
        this.createdAt,
        this.updatedAt,
        this.firstLogin,
        this.following,
        this.isVerified,
        this.deletedAt,
        this.twitterToken,
        this.award,
        this.socialPassword,
        this.onesignalIdMobile,
        this.onesignalIdWeb,
        this.profilePicRealPath});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    alamat = json['alamat'];
    phoneNumber = json['phone_number'];
    profilePic = json['profile_pic'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    aboutMe = json['about_me'];
    facebookId = json['facebook_id'];
    twitterId = json['twitter_id'];
    point = json['point'];
    isLive = json['is_live'];
    followers = json['followers'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstLogin = json['first_login'];
    following = json['following'];
    isVerified = json['is_verified'];
    deletedAt = json['deleted_at'];
    twitterToken = json['twitter_token'];
    award = json['award'];
    socialPassword = json['social_password'];
    onesignalIdMobile = json['onesignal_id_mobile'];
    onesignalIdWeb = json['onesignal_id_web'];
    profilePicRealPath = json['profile_pic_real_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['alamat'] = this.alamat;
    data['phone_number'] = this.phoneNumber;
    data['profile_pic'] = this.profilePic;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['about_me'] = this.aboutMe;
    data['facebook_id'] = this.facebookId;
    data['twitter_id'] = this.twitterId;
    data['point'] = this.point;
    data['is_live'] = this.isLive;
    data['followers'] = this.followers;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_login'] = this.firstLogin;
    data['following'] = this.following;
    data['is_verified'] = this.isVerified;
    data['deleted_at'] = this.deletedAt;
    data['twitter_token'] = this.twitterToken;
    data['award'] = this.award;
    data['social_password'] = this.socialPassword;
    data['onesignal_id_mobile'] = this.onesignalIdMobile;
    data['onesignal_id_web'] = this.onesignalIdWeb;
    data['profile_pic_real_path'] = this.profilePicRealPath;
    return data;
  }
}

class BeritaMedia {
  String id;
  String mediaType;
  String fileType;
  String fileSize;
  String filePath;
  String fileName;
  String thumbnail;
  Null sort;
  int isActive;
  Null editedBy;
  Null approvedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String thumbnailReal;
  String filePathReal;
  Pivot pivot;

  BeritaMedia(
      {this.id,
        this.mediaType,
        this.fileType,
        this.fileSize,
        this.filePath,
        this.fileName,
        this.thumbnail,
        this.sort,
        this.isActive,
        this.editedBy,
        this.approvedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.thumbnailReal,
        this.filePathReal,
        this.pivot});

  BeritaMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaType = json['media_type'];
    fileType = json['file_type'];
    fileSize = json['file_size'];
    filePath = json['file_path'];
    fileName = json['file_name'];
    thumbnail = json['thumbnail'];
    sort = json['sort'];
    isActive = json['is_active'];
    editedBy = json['edited_by'];
    approvedBy = json['approved_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    thumbnailReal = json['thumbnail_real'];
    filePathReal = json['file_path_real'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['file_type'] = this.fileType;
    data['file_size'] = this.fileSize;
    data['file_path'] = this.filePath;
    data['file_name'] = this.fileName;
    data['thumbnail'] = this.thumbnail;
    data['sort'] = this.sort;
    data['is_active'] = this.isActive;
    data['edited_by'] = this.editedBy;
    data['approved_by'] = this.approvedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['thumbnail_real'] = this.thumbnailReal;
    data['file_path_real'] = this.filePathReal;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int beritaId;
  String idaMediaId;

  Pivot({this.beritaId, this.idaMediaId});

  Pivot.fromJson(Map<String, dynamic> json) {
    beritaId = json['berita_id'];
    idaMediaId = json['ida_media_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['berita_id'] = this.beritaId;
    data['ida_media_id'] = this.idaMediaId;
    return data;
  }
}

class Comment {
  int id;
  String judul;
  String isi;
  String tipe;
  int kategoriId;
  int createdBy;
  String uploadItem;
  int isApproved;
  int like;
  int view;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String thumbnail;
  int parentId;
  String liveStreamKey;
  int isEdited;
  Null approvedBy;
  String version;
  String slug;
  String dateCreated;
  String timeCreated;
  String rssDate;
  String uploadItemReal;
  String thumbnailReal;
  User user;

  Comment(
      {this.id,
        this.judul,
        this.isi,
        this.tipe,
        this.kategoriId,
        this.createdBy,
        this.uploadItem,
        this.isApproved,
        this.like,
        this.view,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.thumbnail,
        this.parentId,
        this.liveStreamKey,
        this.isEdited,
        this.approvedBy,
        this.version,
        this.slug,
        this.dateCreated,
        this.timeCreated,
        this.rssDate,
        this.uploadItemReal,
        this.thumbnailReal,
        this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    isi = json['isi'];
    tipe = json['tipe'];
    kategoriId = json['kategori_id'];
    createdBy = json['created_by'];
    uploadItem = json['upload_item'];
    isApproved = json['is_approved'];
    like = json['like'];
    view = json['view'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    thumbnail = json['thumbnail'];
    parentId = json['parent_id'];
    liveStreamKey = json['live_stream_key'];
    isEdited = json['is_edited'];
    approvedBy = json['approved_by'];
    version = json['version'];
    slug = json['slug'];
    dateCreated = json['date_created'];
    timeCreated = json['time_created'];
    rssDate = json['rss_date'];
    uploadItemReal = json['upload_item_real'];
    thumbnailReal = json['thumbnail_real'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['isi'] = this.isi;
    data['tipe'] = this.tipe;
    data['kategori_id'] = this.kategoriId;
    data['created_by'] = this.createdBy;
    data['upload_item'] = this.uploadItem;
    data['is_approved'] = this.isApproved;
    data['like'] = this.like;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['thumbnail'] = this.thumbnail;
    data['parent_id'] = this.parentId;
    data['live_stream_key'] = this.liveStreamKey;
    data['is_edited'] = this.isEdited;
    data['approved_by'] = this.approvedBy;
    data['version'] = this.version;
    data['slug'] = this.slug;
    data['date_created'] = this.dateCreated;
    data['time_created'] = this.timeCreated;
    data['rss_date'] = this.rssDate;
    data['upload_item_real'] = this.uploadItemReal;
    data['thumbnail_real'] = this.thumbnailReal;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}