import 'package:aplikasi/pages/calender.dart';
import 'package:aplikasi/pages/home.dart';
import 'package:aplikasi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi/login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Profile(),
    Calender(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Apakah Anda ingin keluar aplikasi?',
                middleText:
                    'Pilih Ya untuk keluar atau Tidak untuk tetap di dashboard.',
                textConfirm: 'Ya',
                textCancel: 'Tidak',
                onConfirm: () {
                  Get.offAll(const Login()); // Navigasi ke halaman login
                },
                onCancel: () {
                  Get.back(); // Tutup dialog jika pengguna memilih Tidak
                },
              );
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 247, 24, 9),
        unselectedItemColor: const Color.fromARGB(255, 5, 127, 227),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Kalender',
          ),
        ],
      ),
    );
  }
}
