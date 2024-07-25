class Options {
  String? id;
  String? symbol;
  String? currencySymbol;
  String? type;
  String? rateUsd;

  Options({this.id, this.symbol, this.currencySymbol, this.type, this.rateUsd});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    currencySymbol = json['currencySymbol'];
    type = json['type'];
    rateUsd = json['rateUsd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['currencySymbol'] = currencySymbol;
    data['type'] = type;
    data['rateUsd'] = rateUsd;
    return data;
  }
}
