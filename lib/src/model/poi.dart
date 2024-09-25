part of flutter_kmap_kit;

class Poi {
  const Poi({
    required this.isPoi,
    this.layerId = "",
    this.poiId = "",
    this.name = "",
  });

  final bool isPoi;
  final String layerId;
  final String poiId;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'isPoi': isPoi,
      'layerId': layerId,
      'poiId': poiId,
      'name': name,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Poi(
      isPoi: map['isPoi'],
      layerId: map['layerId'],
      poiId: map['poiId'],
      name: map['name'],
    );
  }
}