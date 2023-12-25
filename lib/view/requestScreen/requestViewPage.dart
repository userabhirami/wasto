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
      required this.location});

  final String name;
  final String mobileNumber;
  final String wasteType;
  final String location;
  final String quantity;

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
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestAcceptPage(
                              name: widget.name,
                              mobileNumber: widget.mobileNumber,
                              location: widget.location,
                              quantity: widget.quantity,
                              wasteType: widget.wasteType),
                        ));
                  },
                  child: Text("Accept")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestRejectPage(),
                        ));
                  },
                  child: Text("Reject")),
            ],
          ),
        ),
      ]),
    );
  }
}
