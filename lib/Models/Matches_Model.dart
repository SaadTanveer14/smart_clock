class MatchesModel {
  List<SearchResult>? searchResult;

  MatchesModel({this.searchResult});

  MatchesModel.fromJson(Map<String, dynamic> json) {
    if (json['search_result'] != null) {
      searchResult = <SearchResult>[];
      json['search_result'].forEach((v) {
        searchResult!.add(SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchResult != null) {
      data['search_result'] =
          this.searchResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResult {
  String? name;
  UpcomingMatch? upcomingMatch;

  SearchResult({this.name, this.upcomingMatch});

  SearchResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    upcomingMatch = json['upcoming_match'] != null && json['upcoming_match'] != "No data found"
        ? UpcomingMatch.fromJson(json['upcoming_match'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    print(data['upcoming_match']);
    if (this.upcomingMatch != null && this.upcomingMatch!="No data found") {
      data['upcoming_match'] = this.upcomingMatch!.toJson();
    }
    return data;
  }
}

class UpcomingMatch {
  String? label;
  String? home;
  String? away;
  String? time;
  String? homeImg;
  String? awayImg;


  UpcomingMatch({this.label, this.home, this.away, this.time, this.homeImg, this.awayImg});

  UpcomingMatch.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    home = json['home'];
    away = json['away'];
    time = json['time'];
    homeImg = json['home_img'];
    awayImg = json['away_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['home'] = this.home;
    data['away'] = this.away;
    data['time'] = this.time;
    data['home_img'] = this.homeImg;
    data['away_img'] = this.awayImg;
    return data;
  }
}