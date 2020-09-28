class Agenda_Model {
  List<Sessions> sessions;

  Agenda_Model({this.sessions});

  Agenda_Model.fromJson(Map<String, dynamic> json) {
    if (json['sessions'] != null) {
      sessions = new List<Sessions>();
      json['sessions'].forEach((v) {
        sessions.add(new Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sessions != null) {
      data['sessions'] = this.sessions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  String sessionId;
  String sessionStartTime;
  String sessionTotalTime;
  String sessionTitle;
  String sessionDesc;
  String speakerImage;
  String speakerName;
  String speakerDesc;
  String track;

  Sessions(
      {this.sessionId,
        this.sessionStartTime,
        this.sessionTotalTime,
        this.sessionTitle,
        this.sessionDesc,
        this.speakerImage,
        this.speakerName,
        this.speakerDesc,
        this.track});

  Sessions.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    sessionStartTime = json['session_start_time'];
    sessionTotalTime = json['session_total_time'];
    sessionTitle = json['session_title'];
    sessionDesc = json['session_desc'];
    speakerImage = json['speaker_image'];
    speakerName = json['speaker_name'];
    speakerDesc = json['speaker_desc'];
    track = json['track'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['session_start_time'] = this.sessionStartTime;
    data['session_total_time'] = this.sessionTotalTime;
    data['session_title'] = this.sessionTitle;
    data['session_desc'] = this.sessionDesc;
    data['speaker_image'] = this.speakerImage;
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['track'] = this.track;
    return data;
  }
}
