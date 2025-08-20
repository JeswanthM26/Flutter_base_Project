// import 'package:flutter/material.dart';
// import 'package:flutter_base_pro/data/repositories/stock_repository.dart';
// import 'package:flutter_base_pro/models/stock_model.dart';

// class StockScreen extends StatefulWidget {
//   const StockScreen({super.key});

//   @override
//   State<StockScreen> createState() => _StockScreenState();
// }

// class _StockScreenState extends State<StockScreen> {
//   final StockRepository stockRepo = StockRepository();
//   List<StockModel> stocks = [];
//   bool isLoading = true;
//   String errorMessage = "";

//   @override
//   void initState() {
//     super.initState();
//     _loadStocks();
//   }

//   Future<void> _loadStocks() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = "";
//     });

//     try {
//       final data = await stockRepo.fetchTopGainersLosers();
//       setState(() {
//         stocks = data;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Top Gainers")),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : errorMessage.isNotEmpty
//               ? Center(child: Text("Error: $errorMessage"))
//               : ListView.builder(
//                   itemCount: stocks.length,
//                   itemBuilder: (context, index) {
//                     final stock = stocks[index];
//                     return ListTile(
//                       title: Text(stock.ticker),
//                       subtitle: Text("Price: ${stock.price}"),
//                       trailing: Text(
//                         "${stock.changePercentage}",
//                         style: TextStyle(
//                           color: stock.changePercentage.contains("-")
//                               ? Colors.red
//                               : Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadStocks,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_base_pro/core/utils/apz_api_service.dart';
import 'package:flutter_base_pro/data/enums/apz_api_enums.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  final ApiService _apiService = ApiService();
  Map<String, dynamic>? _data;
  bool _loading = false;
  String? _error;

  Future<void> _fetchData() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await _apiService.request(
        url: "https://www.alphavantage.co/query",
        method: HttpMethod.get,
        queryParams: {
          "function": "TOP_GAINERS_LOSERS",
          "apikey": "9QSQMIV2IFKZA17C",
        },
      );

      setState(() {
        _data = result;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Gainers & Losers")),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _error != null
                ? Text("Error: $_error")
                : _data == null
                    ? ElevatedButton(
                        onPressed: _fetchData, child: const Text("Fetch Data"))
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          Text("API Response:", style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 10),
                          Text(_data.toString()), // 👀 Raw dump
                        ],
                      ),
      ),
    );
  }
}
