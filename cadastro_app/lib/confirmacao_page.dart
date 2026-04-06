import 'package:flutter/material.dart';

class ConfirmacaoPage extends StatelessWidget {
final String nome;
final String idade;
final String email;
final String sexo;
final bool termos;

const ConfirmacaoPage({
super.key,
required this.nome,
required this.idade,
required this.email,
required this.sexo,
required this.termos,
});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Confirmação")),
body: Padding(
padding: const EdgeInsets.all(16),
child: Column(
children: [

Text("Nome: $nome"),
Text("Idade: $idade"),
Text("Email: $email"),
Text("Sexo: $sexo"),
Text("Termos: ${termos ? "Sim" : "Não"}"),

SizedBox(height: 20),

ElevatedButton(
onPressed: () => Navigator.pop(context),
child: Text("Voltar"),
),

ElevatedButton(
onPressed: () => Navigator.pop(context),
child: Text("Editar"),
)
],
),
),
);
}
}
