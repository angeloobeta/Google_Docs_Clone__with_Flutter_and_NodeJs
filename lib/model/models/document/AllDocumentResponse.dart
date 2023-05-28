class AllDocumentResponse {
  String? sId;
  String? uid;
  String? title;
  List<String>? content;
  int? iV;

  AllDocumentResponse({this.sId, this.uid, this.title, this.content, this.iV});

  AllDocumentResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    title = json['title'];
    content = json['content'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['__v'] = this.iV;
    return data;
  }
}
