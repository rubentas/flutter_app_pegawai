import 'package:aplikasi/api/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formState = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future<void> _masuk() async {
    var response = await DataService().LoginService(_user.text, _pass.text);
    if (response == true) {
      Get.offAll(() => const Dashboard()); // Konsisten gunakan `const`
    } else {
      Get.defaultDialog(
        title: 'Login Gagal',
        middleText: 'Username atau password salah',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            print('ini adalah tombol menu');
          },
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('ini setting');
            },
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              print('ini pencarian');
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2022/09/27/19/46/ai-generated-7483596_960_720.jpg'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
                controller: _user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    _masuk();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.blueGrey,
                  elevation: 10,
                ),
                child: const Text(
                  'MASUK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
