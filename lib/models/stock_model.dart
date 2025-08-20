class StockModel {
  final String ticker;
  final String price;
  final String changeAmount;
  final String changePercentage;

  StockModel({
    required this.ticker,
    required this.price,
    required this.changeAmount,
    required this.changePercentage,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      ticker: json['ticker'] ?? "",
      price: json['price'] ?? "",
      changeAmount: json['change_amount'] ?? "",
      changePercentage: json['change_percentage'] ?? "",
    );
  }
}
