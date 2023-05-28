class CreateDocumentResponse {
  Document? document;

  CreateDocumentResponse({this.document});

  CreateDocumentResponse.fromJson(Map<String, dynamic> json) {
    document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.document != null) {
      data['document'] = this.document!.toJson();
    }
    return data;
  }
}

class Document {
  String? title;
  List<dynamic>? content;
  String? sId;
  int? iV;

  Document({this.title, this.content, this.sId, this.iV});

  Document.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
