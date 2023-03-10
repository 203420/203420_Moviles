import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/api/facebook_signin_api.dart';
import 'package:new_app/api/google_signin_api.dart';
import 'package:new_app/api/user_class.dart';
import 'package:new_app/pages/login.dart';
import 'package:new_app/pages/passw_recvover1.dart';
import 'package:new_app/pages/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/pages/user_data.dart';




class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  Future <void> signIn(BuildContext context) async {
    final user = await GoogleSignInApi.login();
    if (user != null) {
      try {
        final GoogleSignInAuthentication googleAuth = await user.authentication;
        var url = Uri.http('192.168.137.223:8000', 'auth/social');
        var response = await http.post(url, body: {'nombre': user.displayName, 'email': user.email});
        print(response.statusCode);
        if (response.statusCode == 200){
          final data = jsonDecode(response.body);
          User user = User(data['nombre'], data['email'], data['token'], 'GOOGLE');
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserData(user: user)));
        }
      }catch (e){
        print(e);
      }
     
    }
  }

  Future <void> signInFB(BuildContext context) async {
    final user = await FacebookSignInApi.loginFb();
    if (user != null) {
      try {
        var url = Uri.http('192.168.137.223:8000', 'auth/social');
        var response = await http.post(url, body: {'nombre': user['name'], 'email': user['email']});
        print(response.statusCode);
        if (response.statusCode == 200){
          final data = jsonDecode(response.body);
          User user = User(data['nombre'], data['email'], data['token'], 'FB');
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserData(user: user)));
        }
      }catch (e){
        print(e);
      }
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 75, left: 40, right: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    width: 235,
                    child: (Image.asset(
                      "assets/images/logo2.png",
                      height: 200,
                    )),
                  ),
                ),
                SizedBox(
                  width: 320,
                  height: 210,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () => signIn(context),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          backgroundColor:
                              const Color.fromARGB(255, 249, 249, 249),
                          side: const BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(255, 249, 249, 249)),
                          elevation: 5
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 14, bottom: 14, left: 6, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                               Image.asset(
                                'assets/images/google_icon_color.png',
                                  height: 24,
                                  width: 24,
                                ),
                              const Text(
                                "Continuar con Google",
                                style: TextStyle(
                                    fontSize: 17, color: Color.fromARGB(255, 84, 84, 84)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => signInFB(context),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          backgroundColor:
                              const Color.fromRGBO(66 ,103 ,178,1),
                          side: const BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(66 ,103 ,178,1)),
                          elevation: 3
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 14, bottom: 14, left: 6, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.facebook,
                                size: 28,
                                color: Colors.white,
                              ),
                              Text(
                                "Continuar con Facebook",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()))
                          },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          side: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 88, 88, 88)),
                          elevation: 3
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 14, bottom: 14, left: 6, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.mail,
                                size: 28,
                                color: Color.fromARGB(255, 88, 88, 88),
                              ),
                              Text(
                                "Registrarse con e-mail",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 88, 88, 88)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65),
                  child: SizedBox(
                    width: 320,
                    height: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => {},
                          child: const Text(
                            "Entrar como invitado",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 216, 67, 99)),
                          ),
                        ),
                        InkWell(
                          onTap: () => {},
                          child: const Text(
                            "Entrar como vendedor",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(117, 167, 86, 1.000)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: InkWell(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()))
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                           Text(
                            "??Ya tienes una cuenta? ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 73, 73, 73)),
                          ),
                          Text(
                            "Iniciar sesi??n",
                            style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 216, 67, 99)),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  
}
