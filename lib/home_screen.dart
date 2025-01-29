import 'package:flutter/material.dart';
import 'package:lazyscroll/lazy_loading.dart';
import 'package:lazyscroll/pagination.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        title: Text("Pagination and Lazy-Loading"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.blue, Colors.pink])
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LazyLoading()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent
                  ),
                  child: Text("Lazy Loading", style: TextStyle(color: Colors.white),)),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Colors.pink,Colors.blue])
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pagination()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent
                  ),
                  child: Text("Pagination", style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
