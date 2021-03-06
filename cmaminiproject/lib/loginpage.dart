
import 'package:cmaminiproject/homepage.dart';
import 'package:cmaminiproject/reset.dart';
import 'package:cmaminiproject/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:firebase_auth/firebase_auth.dart';



class  LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
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
                  child: Text("Sign In Here",
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
                  onPressed: ()  async {
                    final String email = emailController.text.trim();
                    final String password = passwordController.text.trim();


                    if(email.isEmpty){
                      print("Email is empty");
                    }
                    if(password.isEmpty){
                      print("Password is empty");
                    }

                    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomePage()));
                  },
                  color: Colors.blueGrey,
                  child: const Text("Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),),
                ),
                const Text("Don't have an account already?"),
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                    ),

                    FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                      },
                      color: Colors.blueGrey,
                      child: const Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),),
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPage()));
                      },
                      color: Colors.blueGrey,
                      child: const Text("Reset Password",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
