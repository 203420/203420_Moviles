import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_app/pages/passwo_recover2.dart';

class PasswR1 extends StatelessWidget {
  const PasswR1({super.key});

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
                                  "Recuperar contraseña",
                                  style: TextStyle(
                                      fontSize: 20.5, color: Colors.white),
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
                          padding: EdgeInsets.only(bottom: 40),
                          child: Text(
                            "Ingresa tu email para recuperar la contraseña",
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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 25),
                            child: Text(
                              "Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña.",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 122, 122, 122)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 370),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswR2()))},
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
                                "Enviar solicitud",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white),
                              ),
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
