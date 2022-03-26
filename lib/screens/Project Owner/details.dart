import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text("Worker Details",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22
            ),
          ),
          SizedBox(
              height: 200,
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Text("Name:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              )),
        ]

      ),
    );
  }
}
