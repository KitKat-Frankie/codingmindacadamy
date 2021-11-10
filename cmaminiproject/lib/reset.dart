import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:firebase_auth/firebase_auth.dart';





class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white70,
        title: const Text("Todo",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal
          ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Card(
          shadowColor: Colors.black12,
          semanticContainer: true,
          color: Colors.grey,
          borderOnForeground: false,
          child: Center(
            child: Column(
              children: [
                ImageSlideshow(
                  initialPage: 1,
                  indicatorColor: Colors.pinkAccent,
                  indicatorBackgroundColor: Colors.blueGrey,
                  height: 460,
                  width: double.infinity,
                  children: [
                    Image.asset(
                      "assets/images/car2.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/cats.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/car2.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/cats.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ],

                  autoPlayInterval: 5000,
                ),

                const Center(
                  child: Text("Sign Up Here",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    hintText: "Enter the your password",
                  ),
                  controller: emailController,

                ),
                const SizedBox(
                  height: 12,
                ),
                FlatButton(
                  onPressed: () async{
                    final String email = emailController.text.trim();



                    if(email.isEmpty){
                      print("Email is empty");
                    }
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value){
                      print("Successfully Sent Reset");
                      Navigator.pop(context);

                    });
                  },
                  color: Colors.blueGrey,
                  child: const Text("Reset",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
