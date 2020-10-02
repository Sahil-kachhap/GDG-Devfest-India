class Speaker {
  List<Speakers> speakers;

  Speaker({this.speakers});

  Speaker.fromJson(Map<String, dynamic> json) {
    if (json['speakers'] != null) {
      speakers = new List<Speakers>();
      json['speakers'].forEach((v) {
        speakers.add(new Speakers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speakers != null) {
      data['speakers'] = this.speakers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Speakers {
  String speakerImage;
  String speakerName;
  String speakerDesc;
  String about;
  String company;
  String speakerSession;
  String track;
  String day;
  String linkedinUrl;
  String twitterUrl;

  Speakers(
      {this.speakerImage,
        this.speakerName,
        this.speakerDesc,
        this.about,
        this.company,
        this.speakerSession,
        this.track,
        this.day,
        this.linkedinUrl,
        this.twitterUrl});

  Speakers.fromJson(Map<String, dynamic> json) {
    speakerImage = json['speaker_image'];
    speakerName = json['speaker_name'];
    speakerDesc = json['speaker_desc'];
    about = json['about'];
    company = json['company'];
    speakerSession = json['speaker_session'];
    track = json['track'];
    day = json['day'];
    linkedinUrl = json['linkedin_url'];
    twitterUrl = json['twitter_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speaker_image'] = this.speakerImage;
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['about'] = this.about;
    data['company'] = this.company;
    data['speaker_session'] = this.speakerSession;
    data['track'] = this.track;
    data['day'] = this.day;
    data['linkedin_url'] = this.linkedinUrl;
    data['twitter_url'] = this.twitterUrl;
    return data;
  }
}
