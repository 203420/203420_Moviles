import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 160, left: 40, right: 40),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstrains) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstrains.maxHeight),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipOval(
                          child: (Image.asset(
                            "assets/images/image2.jpg",
                          )),
                        ),
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
                      padding: const EdgeInsets.only(bottom: 40),
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
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 78, 38, 187)),
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                top: 10, bottom: 10, left: 40, right: 40)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 95, 95, 95)),
                          ),
                        )
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
