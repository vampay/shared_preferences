import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? name;
class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? name; 
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
    });
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  void RemoveData () async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
      ),
      body: SingleChildScrollView(
        child:Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            // Show Your name
            children: [
              Text(name ?? "รอสักครู่"),
            const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ย้อนกลับ'),
              ),
              ElevatedButton(
                onPressed: () {RemoveData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                  );
                },
                child: const Text('หน้าแรก'),
              ),
          ],
        ),
        )
      ),
    );
  }
}
