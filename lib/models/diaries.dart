class Diariesdata {
  int? status;
  List<Datadiari>? data;

  Diariesdata({this.status, this.data});

  Diariesdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Datadiari>[];
      json['data'].forEach((v) {
        data!.add( Datadiari.fromJson(v));
      });
    }
  }

 
}

class Datadiari {
  int? id;
  String? note;
  String? date;

  Datadiari({this.id, this.note, this.date});

  Datadiari.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['date'] = this.date;
    return data;
  }
}