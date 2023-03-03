import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/api/facebook_signin_api.dart';
import 'package:new_app/api/google_signin_api.dart';
import 'package:new_app/api/user_class.dart';
import 'package:new_app/pages/first.dart';

class UserData extends StatelessWidget {
  final User user;

  const UserData({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 70,
              child: DecoratedBox(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 55, 29, 99)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: const Color.fromARGB(255, 216, 67, 99),
                            iconSize: 35,
                          ),
                          const Text(
                            "Perfil",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          )
                        ],
                      ),
                      const ImageIcon(
                        AssetImage("assets/images/logo2.png"),
                        size: 85,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.name
                        ),
                       Text(
                          user.email
                        ),
                        Text(
                          user.token
                        ),
                    
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: () async {
                                if (user.type == 'GOOGLE'){
                                  await GoogleSignInApi.logout();
                                }else if (user.type == "FB"){
                                  await FacebookAuth.instance.logOut();
                                }
                                
                                // ignore: use_build_context_synchronously
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage()));
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28)),
                                  backgroundColor:
                                      const Color.fromRGBO(117, 167, 86, 1.000),
                                  side: const BorderSide(
                                      width: 1.5,
                                      color:
                                          Color.fromRGBO(117, 167, 86, 1.000))),
                              child: const Text(
                                "Cerrar sesión",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}