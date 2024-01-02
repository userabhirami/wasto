import 'package:flutter/material.dart';
import 'package:wasto/controller/transportController.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';

class AddTransportation extends StatefulWidget {
  const AddTransportation({super.key});

  @override
  State<AddTransportation> createState() => _AddTransportationState();
}

class _AddTransportationState extends State<AddTransportation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TransportController transController = TransportController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Vehicle"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: numberController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Vehicle Number"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Driver Name"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: mobileController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Driver Mobile"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: ColorConstant.white),
              ),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    mobileController.text.isNotEmpty &&
                    //  statusController.text.isNotEmpty &&
                    numberController.text.isNotEmpty) {
                  transController.addvehicle(
                    drivername: nameController.text,
                    mobile: mobileController.text,
                    number: numberController.text,
                    // status: statusController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Vehicle Added Successfully!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                  //send notification msg to waste master and client
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Fill Driver Name and vehicle number ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  );
                }
              },
              child: Text(
                "Save",
              )),
        ]),
      ),
    );
  }
}
