import 'package:flutter/material.dart';

class Bottomshit extends StatelessWidget {
  const Bottomshit({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Home",
            style: TextStyle(fontSize: 100),
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text("Home"),
                    );
                  },
                );
              },
              child: Text("Show"))
        ],
      ),
    );
  }
}
