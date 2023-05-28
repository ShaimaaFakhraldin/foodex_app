import 'package:flutter/material.dart';
import 'package:foodex_app/features/auth/screens/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

import '../../../global/app_color.dart';
import '../../../global/app_text_style.dart';
import '../../../widgets/action_button.dart';
import '../../intro/on_boarding_2.dart';
import '../bloc/bloc/auth_bloc.dart';



 class SignInScreen extends StatefulWidget {
   static const routeName = "/sinInhScreen";
   const SignInScreen({Key? key}) : super(key: key);

   @override
   State<SignInScreen> createState() => _SignInScreenState();
 }

 class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();
   bool _passwordObscure = true;
  bool _passwordConfirm = true;
  bool _keepSignedIn = false;
  bool _addToEmailList = false;
  bool _isLoading = false;
  final TextEditingController _passwordControl = TextEditingController();
  final Map<String, String> userAuth = {"userEmail": "", "userPassword": ""};
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordControl.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                child: Stack(
                  alignment:Alignment.center ,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Pattern.png",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:  10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ 
                          Image.asset(
                          "assets/images/Logo.png",
                          fit: BoxFit.cover,
                        ),
                          Text("FoodNinja" ,style: TextStyle(color: greenColor2  ,fontSize: 40),),
                          Text("Deliever Favorite Food" ,style: TextStyle(color: lightBgColor  ,fontSize: 13),)
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 40.h,
                child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(

                            "Login To Your Account",

                            style: textStyle1,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              //   border: Border.all(color: greenColor1),
                            ),
                            child: TextFormField(
                              onSaved: (newValue) {
                                userAuth["userEmail"] = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "";
                                }
                                if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return "Please enter a valid email!";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              },
                              decoration: const InputDecoration(
                                //      enabledBorder: OutlineInputBorder(),
                                  hintText: "Email",
                                  //     border: InputBorder.none,
                                  icon: Icon(
                                    Icons.mail,
                                    color: greenColor1,
                                  )),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              onSaved: ((newValue) {
                                userAuth["userPassword"] = newValue!;
                              }),
                              controller: _passwordControl,
                              obscureText: _passwordObscure,
                              focusNode: _passwordFocusNode,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a password";
                                }
                                if (value.length <= 5) {
                                  return "Please enter a strong password!";
                                }
                                return null;
                              },
                              textInputAction:   TextInputAction.done,
                              onFieldSubmitted:  null,

                              decoration: InputDecoration(
                                hintText: "Password",
                                //    border: InputBorder.none,
                                icon: const Icon(
                                  Icons.lock,
                                  color: greenColor1,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (_passwordObscure) {
                                      setState(() {
                                        _passwordObscure = false;
                                      });
                                    } else {
                                      setState(() {
                                        _passwordObscure = true;
                                      });
                                    }
                                  },
                                  icon: Icon(_passwordObscure
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                         Text(
                            "Or Continue with",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                           Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 6.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF4F4F4),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          color: Colors.blue[700],
                                        ),
                                        const Text(" Facebook" ,style: TextStyle(color: Colors.black),)
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 5.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF4F4F4),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/google-icon 1.png"),
                                        const Text(" Google" ,style: TextStyle(color: Colors.black))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(
                                      OnBoarding2.routeName);
                                },
                                child: Text(
                                  "Forgot your Password?",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: greenColor1,
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 12.h,
                child: Column(
                  children: [
                    _isLoading
                        ? const CircularProgressIndicator(
                      color: greenColor1,
                      strokeWidth: 2.0,
                    )
                        : ActionButton(
                        height: 4.5.h,
                        width:  30.w  ,
                        onTap: (){
                          context.read<AuthBloc>().add(LoginRequested(
                            userAuth["userEmail"]!, userAuth["userPassword"]!,
                          ));
                        },
                        text:  "Login"
                             ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpscreen.routeName);

                        /// sign up
                      },
                      child: Text(
                     "Don't have an account yet?, Sign Up",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: greenColor1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


