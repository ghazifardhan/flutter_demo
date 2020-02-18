class NewsListModel {
  int currentPage;
  List<Data> data;
  int from;
  int lastPage;
  String nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  NewsListModel(
      {this.currentPage,
        this.data,
        this.from,
        this.lastPage,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    from = json['from'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
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
  List<BeritaMedia> beritaMedia;

  Data(
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
        this.beritaMedia});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['berita_media'] != null) {
      beritaMedia = new List<BeritaMedia>();
      json['berita_media'].forEach((v) {
        beritaMedia.add(new BeritaMedia.fromJson(v));
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
    if (this.beritaMedia != null) {
      data['berita_media'] = this.beritaMedia.map((v) => v.toJson()).toList();
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