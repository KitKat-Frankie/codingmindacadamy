import 'package:cmaminiproject/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:firebase_core/firebase_core.dart';



class SignUpPage extends StatefulWidget {


  @override
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

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
                  height: 350,
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
                      hintText: "Enter your email",
                  ),
                  controller: emailController,



                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    hintText: "Enter the your password",
                  ),
                  obscureText: true,
                  controller: passwordController,

                ),
                const SizedBox(
                  height: 12,
                ),
                FlatButton(
                    onPressed: () async{
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();


                      if(email.isEmpty){
                        print("Email is empty");
                      }
                      if(password.isEmpty){
                        print("Password is empty");
                      }

                        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                          print("Successfully Signed Up");
                          Navigator.pop(context);
                          
                        });
                    },
                  color: Colors.blueGrey,
                    child: const Text("Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),),
                ),
                const Text("Have an account already"),
                FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },
                  color: Colors.blueGrey,
                  child: const Text("Login",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),),
                )
              ],
            ),
          ),
        ),
      ),

);
  }
}

