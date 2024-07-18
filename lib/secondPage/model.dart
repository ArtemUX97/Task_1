class Options {
  String? open;
  String? high;
  String? low;
  String? close;
  String? volume;
  int? period;

  Options({this.open, this.high, this.low, this.close, this.volume, this.period});

  Options.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    data['period'] = period;
    return data;
  }
}