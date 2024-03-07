import 'package:flutter/material.dart';

class WsErrorPage extends StatefulWidget {
  const WsErrorPage({super.key});

  @override
  State<WsErrorPage> createState() => _WsErrorPageState();
}

class _WsErrorPageState extends State<WsErrorPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ':(',
            style: TextStyle(
              fontSize: 64,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              "Algo deu errado",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Text(
            "Entre em contato com nosso suporte",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
