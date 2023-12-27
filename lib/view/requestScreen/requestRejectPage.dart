import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';

class RequestRejectPage extends StatefulWidget {
  const RequestRejectPage(
      {super.key,
      required this.name,
      required this.mobileNumber,
      required this.wasteType,
      required this.location,
      required this.quantity});
  final String name;
  final String mobileNumber;
  final String wasteType;
  final String location;
  final String quantity;
  @override
  State<RequestRejectPage> createState() => _RequestRejectPageState();
}

class _RequestRejectPageState extends State<RequestRejectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Reject"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              // height: 20,
              // width: 50,
              child: Text("Reason:"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                color: const Color.fromARGB(255, 230, 227, 227),
              ),
            ), //reason
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Rejection Message Send Successfully!"),
                      ),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text("Send")),
            )
          ],
        ),
      ),
    );
  }
}
