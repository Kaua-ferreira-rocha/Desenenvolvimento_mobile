import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaEscolha(),
    );
  }
}

// Primeira tela "inicio"
class TelaEscolha extends StatefulWidget {
  @override
  _TelaEscolhaState createState() => _TelaEscolhaState();
}

class _TelaEscolhaState extends State<TelaEscolha> {
  String escolhaApp = "assets/images/padrao.png";

  final opcoes = [
    "assets/images/pedra.png",
    "assets/images/papel.png",
    "assets/images/tesoura.png"
  ];

  void jogar(String escolhaUsuario) {
    final random = Random();
    escolhaApp = opcoes[random.nextInt(3)];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaResultado(
          escolhaUsuario: escolhaUsuario,
          escolhaApp: escolhaApp,
        ),
      ),
    );
  }

  Widget botaoOpcao(String imagem) {
    return GestureDetector(
      onTap: () => jogar(imagem),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey[300],
        child: Image.asset(imagem, width: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pedra, Papel, Tesoura"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Image.asset(
              escolhaApp,
              width: 60,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Escolha do APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botaoOpcao("assets/images/pedra.png"),
              botaoOpcao("assets/images/papel.png"),
              botaoOpcao("assets/images/tesoura.png"),
            ],
          )
        ],
      ),
    );
  }
}

//Tela de resultado
class TelaResultado extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaApp;

  TelaResultado({
    required this.escolhaUsuario,
    required this.escolhaApp,
  });

  String resultado() {
    if (escolhaUsuario == escolhaApp) {
      return "empate";
    }

    if ((escolhaUsuario.contains("pedra") &&
        escolhaApp.contains("tesoura")) ||
        (escolhaUsuario.contains("papel") &&
            escolhaApp.contains("pedra")) ||
        (escolhaUsuario.contains("tesoura") &&
            escolhaApp.contains("papel"))) {
      return "vitoria";
    }

    return "derrota";
  }

  String imagemResultado() {
    switch (resultado()) {
      case "vitoria":
        return "assets/images/icons8-vitória-48.png";
      case "derrota":
        return "assets/images/icons8-perder-48.png";
      default:
        return "assets/images/icons8-aperto-de-mãos-100.png";
    }
  }

  String textoResultado() {
    switch (resultado()) {
      case "vitoria":
        return "Você venceu!";
      case "derrota":
        return "Você perdeu!";
      default:
        return "Empate!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Pedra, Papel, Tesoura"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // escolha do robo
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Image.asset(escolhaApp, width: 60),
          ),

          SizedBox(height: 10),

          Text(
            "Escolha do APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 30),

          // faça a sua escolha
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
            child: Image.asset(escolhaUsuario, width: 50),
          ),

          SizedBox(height: 10),

          Text(
            "Sua Escolha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 30),

          // resultado se tu foi um bosta ou não
          Image.asset(
            imagemResultado(),
            width: 60,
          ),

          SizedBox(height: 10),

          Text(
            textoResultado(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Jogar novamente"),
          )
        ],
      ),
    );
  }
}