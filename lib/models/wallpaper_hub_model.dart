class WallpaperHubModel {
  String? photographer;
  String? photgrapherUrl;
  int? photgrapherId;
  SrcModels? src;

  WallpaperHubModel(
      {this.src, this.photographer, this.photgrapherId, this.photgrapherUrl});

  factory WallpaperHubModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperHubModel(
      src: SrcModels.fromMap(jsonData["src"]),
      photgrapherUrl: jsonData["photographer_url"],
      photgrapherId: jsonData["photographer_id"],
      photographer: jsonData["photographer"],
    );
  }
}

class SrcModels {
  String? original;
  String? small;
  String? portrait;

  SrcModels({this.original, this.portrait, this.small});

  factory SrcModels.fromMap(Map<String, dynamic> jsonData) {
    return SrcModels(
        original: jsonData["original"],
        small: jsonData["small"],
        portrait: jsonData["portrait"]);
  }
}
