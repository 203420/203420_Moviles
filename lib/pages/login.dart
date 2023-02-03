import 'package:flutter/material.dart';
import 'package:new_app/pages/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 125, left: 40, right: 40),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstrains) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstrains.maxHeight),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: 180,
                        child: (Image.asset(
                          "assets/images/logo.png",
                          height: 180,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          icon: Icon(Icons.mail),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                          icon: Icon(Icons.lock),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        obscureText: true,
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(color: Color.fromARGB(255, 70, 42, 146))),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 70, 42, 146)),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.only(
                                    top: 15, bottom: 15, left: 80, right: 80)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 95, 95, 95)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      )),
    );
  }
}
