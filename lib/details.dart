

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:random_string/random_string.dart';

import 'database.dart';
import 'home_page.dart';





class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  TextEditingController namectrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();
  TextEditingController locationctrl = TextEditingController();




  void _submitForm () async{

    String Id = randomAlphaNumeric(10);
    // _addtoFirestore();
    Map<String, dynamic>employeeInfoMap = {
      'name':namectrl.text,
      'id':Id,
      'age': agectrl.text,
      'location': locationctrl.text,
    };
    await DatabaseMethods().addEmployeeDetails(employeeInfoMap,Id)
        .then((value) {

      Fluttertoast.showToast(
          msg: "Employee details has been uploaded successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );

    });


  }

  final SnackBar _snackBar = SnackBar(content: Text("succeesfully registerd"),duration: Duration(seconds: 4),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Add",style: TextStyle(color: Colors.black,
                fontSize: 24,fontWeight: FontWeight.bold),
            ),
            Text("Details",style: TextStyle(color: Colors.black87,
                fontSize: 24,fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold )),

            SizedBox(
              height: 10.0,
            ),

            Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  controller: namectrl,
                  decoration: InputDecoration(
                      border: InputBorder.none
                  ),
                )
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Age",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold )),

            SizedBox(
              height: 10.0,
            ),

            Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  controller: agectrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none
                  ),
                )
            ),
            SizedBox(
              height: 20,
            ),
            Text("Location",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold )),

            SizedBox(
              height: 10.0,
            ),

            Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  controller: locationctrl,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none
                  ),
                )
            ),

            SizedBox(
              height: 20.0,
            ),

            Center(child: ElevatedButton(onPressed: () {

              _submitForm();

            }, child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ))

          ],
        ),
      ),
    );
  }
}
