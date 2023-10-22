class SparebagModel {
  final String id;
  final String warehouse;
  final String tanggal;
  final String kriteria;
  final String kondisi;
  final String penyebab;
  final String pack;
  final int jumlah;

  SparebagModel({
    required this.id,
    required this.warehouse,
    required this.tanggal,
    required this.kriteria,
    required this.kondisi,
    required this.penyebab,
    required this.pack,
    required this.jumlah,
  });

  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'warehouse': warehouse});
    result.addAll({'tanggal': tanggal});
    result.addAll({'kriteria': kriteria});
    result.addAll({'kondisi': kondisi});
    result.addAll({'penyebab': penyebab});
    result.addAll({'pack': pack});
    result.addAll({'jumlah': jumlah});

    return result;
  }

  factory SparebagModel.fromFirestore(Map<String, dynamic> map) {
    return SparebagModel(
      id: map['id'] ?? '',
      warehouse: map['warehouse'] ?? '',
      tanggal: map['tanggal'] ?? '',
      kriteria: map['kriteria'] ?? '',
      kondisi: map['kondisi'] ?? '',
      penyebab: map['penyebab'] ?? '',
      pack: map['pack'] ?? '',
      jumlah: map['jumlah']?.toInt() ?? 0,
    );
  }
}
