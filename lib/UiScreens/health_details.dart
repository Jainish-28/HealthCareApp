import 'package:flutter/material.dart';

class HealthDetails extends StatefulWidget {
  const HealthDetails({super.key});

  @override
  State<HealthDetails> createState() => _HealthDetailsState();
}

class _HealthDetailsState extends State<HealthDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Health Details"),),
    );
  }
}
