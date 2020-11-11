import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String studentName, studentID, studyProgramID;
  double studentGPA;
  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPS(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };
    documentReference
        .setData(students)
        .whenComplete(() => {print("$studentName Created")});
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()["studentName"]);
      print(datasnapshot.data()["studentID"]);
      print(datasnapshot.data()["studyProgramID"]);
      print(datasnapshot.data()["studentGPA"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };
    documentReference
        .setData(students)
        .whenComplete(() => {print("$studentName Updated")});
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").doc(studentName);
    documentReference
        .delete()
        .whenComplete(() => print("$studentName Deleted"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bbb"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String name) {
                    getStudentName(name);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Student ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String id) {
                    getStudentID(id);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Study Program ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String programID) {
                    getStudyProgramID(programID);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "GPA ",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String gpa) {
                    getStudentGPS(gpa);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      createData();
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Create"),
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      readData();
                    },
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Read"),
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      updateData();
                    },
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Update"),
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      deleteData();
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("Delete"),
                    textColor: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Expanded(child: Text("Name")),
                    Expanded(child: Text("Student ID")),
                    Expanded(child: Text("Program ID")),
                    Expanded(child: Text("GPA"))
                  ],
                ),
              ),
              StreamBuilder(
                stream: Firestore.instance.collection("MyStudents").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.documents[index];
                        return Row(
                          children: [
                            Expanded(
                                child: Text(documentSnapshot["studentName"])),
                            Expanded(
                                child: Text(documentSnapshot["studentID"])),
                            Expanded(
                                child:
                                    Text(documentSnapshot["studyProgramID"])),
                            Expanded(
                                child: Text(
                                    documentSnapshot["studentGPA"].toString())),
                          ],
                        );
                      },
                    );
                  } else {
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
