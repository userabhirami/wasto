import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';

class RequestAcceptPage extends StatefulWidget {
  const RequestAcceptPage(
      {super.key,
      required this.name,
      required this.mobileNumber,
      required this.quantity,
      required this.wasteType,
      required this.location});

  final String name;
  final String mobileNumber;
  final String wasteType;
  final String location;
  final String quantity;

  @override
  State<RequestAcceptPage> createState() => _RequestAcceptPageState();
}

class _RequestAcceptPageState extends State<RequestAcceptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Confirmation"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Name: "),
                ),
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(widget.name),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Mobile Number: "),
                ),
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(widget.mobileNumber),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Quantity: "),
                ),
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(widget.quantity),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Waste Type: "),
                ),
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(widget.wasteType),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Location: "),
                ),
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(widget.location),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,

                  child: Text("Waste Master Name : "),
                ),
                Container(
                  height: 20,
                  width: 200,
                  child: Text("drop down button"),
                )

                // add drop down button
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Mobile Number: "),
                ),
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(widget.location),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Date: "),
                ),

                Container(
                  height: 20,
                  width: 100,
                  child: Text("date picker"),
                )
                //add date picker
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text("Time: "),
                ),

                Container(
                  height: 20,
                  width: 100,
                  child: Text("time picker"),
                )
                //add time picker
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content:
                            Text("Confirmation Message Send Successfully!"),
                      ),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                    //send notification msg to waste master and client
                  },
                  child: Text("Send")),
            ],
          ),
        ],
      ),
    );
  }
}
