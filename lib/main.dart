import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue.shade900,
      hintColor: Colors.cyan,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String employeeName,
      employeePosition,
      employeeContact,
      employeeDepartment;

  getEmployeeName(name) {
    this.employeeName = name;
  }

  getEmployeePosition(position) {
    this.employeePosition = position;
  }

  getEmployeeContact(contact) {
    this.employeeContact = contact;
  }

  getEmployeeDepartment(department) {
    this.employeeDepartment = department;
  }

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyEmployees").doc(employeeName);

    //create a Map
    Map<String, dynamic> employee = {
      "employeeName": employeeName,
      "employeePosition": employeePosition,
      "employeeContact": employeeContact,
      "employeeDepartment": employeeDepartment
    };

    documentReference.set(employee).whenComplete(() {
      print("$employeeName created successfully");
    });
  }

  readData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyEmployees").doc(employeeName);

    documentReference.get().then((snapshot) {
      print(snapshot.get("employeeName"));
      print(snapshot.get("employeePosition"));
      print(snapshot.get("employeeContact"));
      print(snapshot.get("employeeDepartment"));
    });
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyEmployees").doc(employeeName);

    //create a Map
    Map<String, dynamic> employee = {
      "employeeName": employeeName,
      "employeePosition": employeePosition,
      "employeeContact": employeeContact,
      "employeeDepartment": employeeDepartment
    };

    documentReference.set(employee).whenComplete(() {
      print("$employeeName updated successfully");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyEmployees").doc(employeeName);

    documentReference.delete().whenComplete(() {
      print("$employeeName deleted successfully");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Hotel Management System",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 2.0))),
                onChanged: (String name) {
                  getEmployeeName(name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Position",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 2.0))),
                onChanged: (String position) {
                  getEmployeePosition(position);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Contact Number",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 2.0))),
                onChanged: (String contact) {
                  getEmployeeContact(contact);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Department",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 2.0))),
                onChanged: (String department) {
                  getEmployeeDepartment(department);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green[900])),
                    onPressed: () {
                      createData();
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blue[900])),
                    onPressed: () {
                      readData();
                    },
                    child: Text(
                      "View",
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow[900])),
                    onPressed: () {
                      updateData();
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.red[900])),
                    onPressed: () {
                      deleteData();
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(textDirection: TextDirection.ltr, children: <Widget>[
                Expanded(child: Text("Name")),
                Expanded(child: Text("Position")),
                Expanded(child: Text("Contact")),
                Expanded(child: Text("Department")),
              ]),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("MyEmployees")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      // Extract relevant fields from the documentSnapshot
                      String employeeName =
                          documentSnapshot["employeeName"] ?? "";
                      String employeePosition =
                          documentSnapshot["employeePosition"] ?? "";
                      String employeeContact =
                          documentSnapshot["employeeContact"] ?? "";
                      String employeeDepartment =
                          documentSnapshot["employeeDepartment"] ?? "";

                      // Display the data in a Row
                      return Row(
                        children: <Widget>[
                          Expanded(child: Text(employeeName)),
                          Expanded(child: Text(employeePosition)),
                          Expanded(child: Text(employeeContact)),
                          Expanded(child: Text(employeeDepartment)),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  // Handle error state (e.g., display an error message)
                  return Text("Error fetching data from Firestore");
                } else {
                  // Handle loading state (e.g., display a loading indicator)
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
