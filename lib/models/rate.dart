class Rate {
  final int curId;
  final String date;
  final String curAbbreviation;
  final int curScale;
  final String curName;
  final double curOfficialRate;

  Rate({
    required this.curId,
    required this.date,
    required this.curAbbreviation,
    required this.curScale,
    required this.curName,
    required this.curOfficialRate,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      curId: json['Cur_ID'],
      date: json['Date'],
      curAbbreviation: json['Cur_Abbreviation'],
      curScale: json['Cur_Scale'],
      curName: json['Cur_Name'],
      curOfficialRate: json['Cur_OfficialRate'].toDouble(),
    );
  }
}