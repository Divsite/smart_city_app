  class ProfileResponse {
    ProfileResponse({
      required this.nama,
      required this.emel,
      required this.kementrian,
      required this.jabatan,
      required this.cawangan,
    });
    
    late final String nama;
    late final String emel;
    late final String kementrian;
    late final String jabatan;
    late final String cawangan;

    ProfileResponse.fromJson(Map<String, dynamic> json){
      nama = json['nama'] ?? "";
      emel = json['e-mel'] ?? "";
      kementrian = json['kementrian'] ?? "";
      jabatan = json['jabatan'] ?? "";
      cawangan = json['cawangan'] ?? "";
    }

    Map<String, dynamic> toJson() {
      final data = <String, dynamic>{};
      data['nama'] = nama;
      data['e-mel'] = emel;
      data['kementrian'] = kementrian;
      data['jabatan'] = jabatan;
      data['cawangan'] = cawangan;

      return data;
    }
  }