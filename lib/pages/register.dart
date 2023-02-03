import 'package:flutter/material.dart';
import 'package:new_app/pages/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 25),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstrains) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstrains.maxHeight),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                       child: SizedBox(
                        width: 180,
                        child: (Image.asset(
                          "assets/images/logo.png",
                          height: 180,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                      
                        decoration: const InputDecoration(
                          labelText: "Username",
                          icon: Icon(Icons.person),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                          icon: Icon(Icons.mail),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Last name",
                          icon: Icon(Icons.text_fields_sharp),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "First name",
                          icon: Icon(Icons.text_fields_sharp),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: const [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              labelText: "Age",
                              icon: Icon(Icons.calendar_month),
                            ),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              labelText: "Gender",
                              icon: Icon(Icons.wc),
                            ),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Phone",
                          icon: Icon(Icons.phone),
                        ),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Confirm password",
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
                            'Register',
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
                                      builder: (context) => const Login()));
                            },
                            child: const Text(
                              "Login",
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
