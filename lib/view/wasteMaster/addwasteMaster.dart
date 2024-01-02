import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasto/controller/masterController.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';

class AddWasteMaster extends StatefulWidget {
  const AddWasteMaster({super.key});

  @override
  State<AddWasteMaster> createState() => _AddWasteMasterState();
}

class _AddWasteMasterState extends State<AddWasteMaster> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  MasterController masterController = MasterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Waste Master"),
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
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Master Name"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: mobileController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Mobile"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: dateController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Date",
              icon: Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Icon(Icons.calendar_today),
              ),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                print("pickedDate: $pickedDate");
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print("formattedDate: $formattedDate");
                setState(() {
                  dateController.text = formattedDate;
                });
              } else {
                SnackBar(
                  content: Text(
                    "Select Date",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: placeController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Place"),
          ),
          SizedBox(height: 10),
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
                    dateController.text.isNotEmpty &&
                    placeController.text.isNotEmpty) {
                  masterController.addwasteMaster(
                    place: placeController.text,
                    name: nameController.text,
                    mob: mobileController.text,
                    date1: dateController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "New Master Added Successfully!",
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
                        "Fill Master Name, Date and Mobile number ",
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
