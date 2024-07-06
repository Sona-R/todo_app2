import 'package:flutter/material.dart';

import 'bottom.dart';






class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height:30,
              ),
              Text("LOGIN PAGE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 50,),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter your mail';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      labelText: "Email",
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.email_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  validator:  (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.lock)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),

                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Bot()),
                    );

                  }



                }, child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),),
              ),
              SizedBox(
                height: 20,

              ),


                  SizedBox(
                    width: 8,
                  ),
                ],
              ),



          ),
        ),

    );
  }
}
