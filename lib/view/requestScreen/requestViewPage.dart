import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/requestScreen/requestAcceptPage.dart';
import 'package:wasto/view/requestScreen/requestRejectPage.dart';

class RequestViewPage extends StatefulWidget {
  RequestViewPage(
      {super.key,
      required this.name,
      required this.mobileNumber,
      required this.quantity,
      required this.wasteType,
      required this.location,
      required this.date});

  final String name;
  final String mobileNumber;
  final String wasteType;
  final String location;
  final String quantity;
  final String date;

  @override
  State<RequestViewPage> createState() => _RequestViewPageState();
}

class _RequestViewPageState extends State<RequestViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Details"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                //   height: 50,
                //  width: 100,
                child: Text(
                  "Name: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                // height: 50,
                // width: 100,
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
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
                child: Text(
                  "Mobile Number: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                // height: 50,
                // width: 100,
                child: Text(
                  widget.mobileNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
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
                child: Text(
                  "Quantity: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                // height: 50,
                // width: 100,
                child: Text(
                  widget.quantity,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
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
                child: Text(
                  "Waste Type: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                // height: 50,
                // width: 100,
                child: Text(
                  widget.wasteType,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
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
                child: Text(
                  "Location: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                // height: 50,
                // width: 100,
                child: Text(
                  widget.location,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
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
                child: Text(
                  "Date: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                // height: 50,
                // width: 100,
                child: Text(
                  widget.date,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorConstant.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestAcceptPage(
                              name: widget.name,
                              mobileNumber: widget.mobileNumber,
                              location: widget.location,
                              quantity: widget.quantity,
                              wasteType: widget.wasteType,
                              value: "accepted"),
                        ));
                  },
                  child: Text(
                    "Accept",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: ColorConstant.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestRejectPage(
                              name: widget.name,
                              mobileNumber: widget.mobileNumber,
                              location: widget.location,
                              quantity: widget.quantity,
                              wasteType: widget.wasteType,
                              value: "rejected"),
                        ));
                  },
                  child: Text(
                    "Reject",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
