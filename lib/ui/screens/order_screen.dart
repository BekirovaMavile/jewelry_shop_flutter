import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказы'),
      ),
      body: Center(
        child: Text('Здесь будет список заказов'),
      ),
    );
  }
}