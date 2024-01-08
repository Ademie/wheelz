class PredictionModel {
  double? lat;
  double? long;
  String? place_id;
  String? main_text;
  String? secondary_text;

  PredictionModel({
    this.lat,
    this.long,
    this.place_id,
    this.main_text,
    this.secondary_text,
  });

  PredictionModel.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    long = json["long"];
    place_id = json["place_id"];
    main_text = json["structured_formatting"]["main_text"];
    secondary_text = json["structured_formatting"]["secondary_text"];
  }
}
