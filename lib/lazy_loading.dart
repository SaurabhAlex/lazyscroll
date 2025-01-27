import 'package:flutter/material.dart';

class LazyLoading extends StatefulWidget {
  const LazyLoading({super.key});

  @override
  State<LazyLoading> createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {
  final _scrollController = ScrollController();

  final items = List.generate(20, (index) => 'Item $index');

  @override
  void initState() {
    _scrollController.addListener(loadMoreItems);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> loadMoreItems() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await Future.delayed(Duration(milliseconds: 1200));
      setState(() {
        items.addAll(
            List.generate(20, (index) => 'Item ${items.length + index}'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lazy Loading"),
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index == items.length) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListTile(
                title: Text(items[index]),
              );
            }
          }),
    );
  }
}
