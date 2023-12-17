import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';

class RequestAcceptPage extends StatelessWidget {
  const RequestAcceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Confirmation"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Text("Name: "),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Text("value"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Text("Mobile Number: "),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Text("value"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Text("Quantity: "),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Text("value"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Text("Waste Type: "),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Text("value"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Text("Location: "),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: Text("value"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Text("Waste Master Name & Mobile Number: "),
              ),
              Container(
                height: 20,
                width: 100,
                child: Text("drop down button"),
              )

              // add drop down button
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 100,
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
          Row(
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
