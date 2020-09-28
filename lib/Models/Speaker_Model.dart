class Speaker_models {
  List<Speakers> speakers;

  Speaker_models({this.speakers});

  Speaker_models.fromJson(Map<String, dynamic> json) {
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
  String speakerSession;
  String fbUrl;
  String githubUrl;
  String linkedinUrl;
  String twitterUrl;

  Speakers(
      {this.speakerImage,
        this.speakerName,
        this.speakerDesc,
        this.speakerSession,
        this.fbUrl,
        this.githubUrl,
        this.linkedinUrl,
        this.twitterUrl});

  Speakers.fromJson(Map<String, dynamic> json) {
    speakerImage = json['speaker_image'];
    speakerName = json['speaker_name'];
    speakerDesc = json['speaker_desc'];
    speakerSession = json['speaker_session'];
    fbUrl = json['fb_url'];
    githubUrl = json['github_url'];
    linkedinUrl = json['linkedin_url'];
    twitterUrl = json['twitter_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speaker_image'] = this.speakerImage;
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['speaker_session'] = this.speakerSession;
    data['fb_url'] = this.fbUrl;
    data['github_url'] = this.githubUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['twitter_url'] = this.twitterUrl;
    return data;
  }
}
