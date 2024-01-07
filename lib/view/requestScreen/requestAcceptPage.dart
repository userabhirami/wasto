import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wasto/controller/requestController.dart';
import 'package:wasto/utils/colorConstant.dart';
import 'package:wasto/view/homeScreen/homeScreen.dart';

class RequestAcceptPage extends StatefulWidget {
  const RequestAcceptPage(
      {super.key,
      required this.name,
      required this.mobileNumber,
      required this.quantity,
      required this.wasteType,
      required this.location,
      required this.value});

  final String name;
  final String mobileNumber;
  final String wasteType;
  final String location;
  final String quantity;
  final String value;

  @override
  State<RequestAcceptPage> createState() => _RequestAcceptPageState();
}

class _RequestAcceptPageState extends State<RequestAcceptPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  RequestController requestController = RequestController();
  //List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  var wasteMaster1;
  var defaultValue = true;

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
                      "Waste Master Name : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('wastemaster')
                          .orderBy('masterName')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Container();
                        if (defaultValue) {
                          wasteMaster1 =
                              snapshot.data!.docs[0].get('masterName');
                          print('setDefault make: $wasteMaster1');
                        }
                        return DropdownButton(
                          isExpanded: false,
                          value: wasteMaster1,
                          items: snapshot.data!.docs.map((value) {
                            return DropdownMenuItem(
                              value: value.get('masterName'),
                              child: Text(
                                '${value.get('masterName')}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(
                              () {
                                print('selected drop down: $value');
                                nameController.text = value.toString();
                                wasteMaster1 = value;
                                defaultValue = false;
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ]),
          ),
          // add drop down button

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
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    controller: mobileController,
                    decoration: InputDecoration(
                        hintText: " Mobile No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
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
                  width: 5,
                ),
                //add date picker
                Expanded(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  // height: 50,
                  // width: 100,
                  child: Text(
                    "Time: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),

                Expanded(
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Icon(Icons.lock_clock),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      var selectedTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      setState(() {
                        timeController.text = selectedTime!.format(context);
                      });
                      print("Selected time: ${selectedTime!.format(context)}");
                    },
                  ),
                ),
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
                        timeController.text.isNotEmpty) {
                      requestController.addData(
                          cusname: widget.name,
                          cusmob: widget.mobileNumber,
                          location: widget.location,
                          quantity: widget.quantity,
                          wastetype: widget.wasteType,
                          masname: nameController.text,
                          masmob: mobileController.text,
                          date: dateController.text,
                          time: timeController.text,
                          value: widget.value);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Confirmation Message Send Successfully!",
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
                            "Fill Master Name, Date and Time field ",
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
                    "Send",
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
