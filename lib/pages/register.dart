// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/pages/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  bool acceptT = false;
  bool obsText = true;

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
                                  color: const Color.fromARGB(255, 216, 67, 99),
                                  iconSize: 35,
                                ),
                                const Text(
                                  "Regístrate",
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 40),
                              child: Text(
                                "Crea una cuenta para empezar a usar la app",
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
                                        child: Text("Nombre",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black)),
                                      )),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Nombre completo",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    validator: (value) {
                                      if (value!.isEmpty || !RegExp(r'^[A-Za-zÁ-Úá-ú ]+$').hasMatch(value)){
                                        return "Por favor, escriba su nombre correctamente";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
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
                                    decoration: InputDecoration(
                                      hintText: "Dirección de correo",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    validator: (value) {
                                      if (value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                                        return "Correo electrónico no válido";
                                      } else {
                                        return null;
                                      }
                                    },
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
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    obscureText: obsText,
                                    validator: (value) {
                                      if (value!.isEmpty || !RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])(.{6,})$').hasMatch(value)){
                                        return "Contraseña no válida";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 25),
                                child: Text(
                                  "La contraseña debe contener caracteres, números, y símbolos con un mínimo de 6 caracteres.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 122, 122, 122)),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: acceptT,
                                  onChanged: (value) => {
                                    setState(() {
                                      acceptT = value!;
                                    })
                                  },
                                  shape: const CircleBorder(),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  child: RichText(
                                      text: TextSpan(
                                          text: "Al registrarme acepto los ",
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: const <TextSpan>[
                                        TextSpan(
                                          text: "términos y condiciones",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 216, 67, 99)),
                                        ),
                                        TextSpan(text: " y la "),
                                        TextSpan(
                                            text: "política de privacidad.",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 216, 67, 99))),
                                      ])),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: OutlinedButton(
                                  onPressed: () => {
                                    if (formKey.currentState!.validate()){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) => const Login()),
                                      ),
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28)),
                                      backgroundColor: const Color.fromRGBO(
                                          117, 167, 86, 1.000),
                                      side: const BorderSide(
                                          width: 1.5,
                                          color: Color.fromRGBO(
                                              117, 167, 86, 1.000))),
                                  child: const Text(
                                    "Crear cuenta",
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()))
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "¿Ya tienes una cuenta? ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 73, 73, 73)),
                                    ),
                                    Text(
                                      "Iniciar sesión",
                                      style: TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.w800,
                                          color:
                                              Color.fromARGB(255, 216, 67, 99)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
