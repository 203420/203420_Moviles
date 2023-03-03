import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter/src/foundation/constants.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/api/user_class.dart';
import 'package:new_app/pages/passw_recvover1.dart';
import 'package:new_app/pages/register.dart';
import 'package:new_app/pages/user_data.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  bool obsText = true;
  final TextEditingController eController = TextEditingController();
  final TextEditingController pController = TextEditingController();

  

  void login(BuildContext context) async {
    try {
        var url = Uri.http('192.168.137.223:8000', 'auth/login');
        var response = await http.post(url, body: {'email': eController.text, 'password': pController.text});
        if (kDebugMode) {
          print('Response status: ${response.statusCode}');
        }
        
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          User user = User(data['nombre'], data['email'], data['token'], 'local');

          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserData(user: user)));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        
    }
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstrains.maxHeight),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 55, 29, 99)),
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
                                  color:
                                      const Color.fromARGB(255, 216, 67, 99),
                                  iconSize: 35,
                                ),
                                const Text(
                                  "Iniciar sesión",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
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
                    padding:
                        const EdgeInsets.only(top: 35, left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 60),
                          child: Text(
                            "Ingresa tus datos",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 99, 99, 99)),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 6),
                                    child: Text("Correo electrónico",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black)),
                                  )),
                              TextFormField(
                                controller: eController,
                                decoration: InputDecoration(
                                  hintText: "Dirección de correo",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 6),
                                    child: Text("Contraseña",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black)),
                                  )),
                              TextFormField(
                                controller: pController,
                                decoration: InputDecoration(
                                  hintText: "Contraseña",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(obsText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        obsText = !obsText;
                                      });
                                    },
                                  ),
                                ),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                                obscureText: obsText,
                              ),
                            ],
                          ),
                        ),
                        
                        
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: () => {
                                login(context)
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
                                "Ingresar",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            onTap: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()))
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "¿No tienes una cuenta? ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 73, 73, 73)),
                                ),
                                Text(
                                  "Registrate",
                                  style: TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 216, 67, 99)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: InkWell(
                            onTap: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswR1()))
                            },
                            child: const Text(
                              "¿Olvidaste tu contraseña? ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 73, 73, 73)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}