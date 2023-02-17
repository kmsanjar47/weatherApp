import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  TextEditingController? citySearchTxtCtl;
  String? cityName;

  @override
  void initState() {
    super.initState();

    citySearchTxtCtl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              size: 50,
            ),
            const SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: TextField(
                controller: citySearchTxtCtl,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter City Name.....",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.grey[700],
                    focusColor: Colors.green),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                if (citySearchTxtCtl!.text.isNotEmpty) {
                  setState(() {
                    cityName = citySearchTxtCtl!.text;
                  });
                  Navigator.pop(context, cityName!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please Enter City Name")));
                }
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
