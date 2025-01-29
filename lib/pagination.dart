import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final List<int> _data = []; // List to hold paginated data
  int _page = 1; // Current page number
  bool _isLoading = false;
  final int _perPage = 10; // Items per page
  final int _maxPages = 5; // Maximum pages for simulation

  @override
  void initState() {
    super.initState();
    _fetchData(); // Load first page on start
  }

  Future<void> _fetchData() async {
    if (_isLoading || _page > _maxPages) return;

    setState(() => _isLoading = true);

    // Simulating API Call Delay
    await Future.delayed(Duration(seconds: 2));

    // Generating fake data (normally comes from API)
    List<int> newData =
    List.generate(_perPage, (index) => (_page - 1) * _perPage + index + 1);

    setState(() {
      _data.addAll(newData);
      _page++;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Pagination Example")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _data.length + 1,
              itemBuilder: (context, index) {
                if (index < _data.length) {
                  return ListTile(title: Text("Item ${_data[index]}"));
                } else if (_isLoading) {
                  return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ));
                } else if (_page <= _maxPages) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: _fetchData,
                      child: Text("Load More"),
                    ),
                  );
                } else {
                  return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("No more data"),
                      ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
