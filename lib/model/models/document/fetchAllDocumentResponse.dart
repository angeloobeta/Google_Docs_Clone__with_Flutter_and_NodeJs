class FetchAllDocumentResponse {
  List<Documents>? documents;

  FetchAllDocumentResponse({this.documents});

  FetchAllDocumentResponse.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  String? sId;
  String? uid;
  String? title;
  List<dynamic>? content;
  int? iV;

  Documents({this.sId, this.uid, this.title, this.content, this.iV});

  Documents.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    title = json['title'];
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content!.add(v);
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['title'] = this.title;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}
