import 'package:flutter/material.dart';
import 'confirmacao_page.dart';

class CadastroPage extends StatefulWidget {
@override
_CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
final nomeController = TextEditingController();
final idadeController = TextEditingController();
final emailController = TextEditingController();

String? sexo;
bool aceitouTermos = false;

void validarCampos() {
try {
if (nomeController.text.isEmpty) {
throw "Nome obrigatório";
}

if (idadeController.text.isEmpty) {
throw "Idade obrigatória";
}

int idade = int.parse(idadeController.text);
if (idade < 18) {
throw "Idade deve ser maior ou igual a 18";
}

if (emailController.text.isEmpty ||
!emailController.text.contains("@") ||
!emailController.text.contains(".")) {
throw "Email inválido";
}

if (sexo == null) {
throw "Selecione o sexo";
}

if (!aceitouTermos) {
throw "Aceite os termos";
}

Navigator.push(
context,
MaterialPageRoute(
builder: (_) => ConfirmacaoPage(
nome: nomeController.text,
idade: idadeController.text,
email: emailController.text,
sexo: sexo!,
termos: aceitouTermos,
),
),
);
} catch (e) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text(e.toString())),
);
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white70,
appBar: AppBar(title: Text("Cadastro de Usuário")),
body: Center(
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

Text(
"Preencha os campos abaixo",
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),

SizedBox(height: 20),

TextField(
controller: nomeController,
decoration: InputDecoration(
hintText: "Nome",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10)),
),
),

SizedBox(height: 10),

TextField(
controller: idadeController,
keyboardType: TextInputType.number,
decoration: InputDecoration(
hintText: "Idade",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10)),
),
),

SizedBox(height: 10),

TextField(
controller: emailController,
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
hintText: "Email",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10)),
),
),

SizedBox(height: 10),

DropdownButtonFormField<String>(
hint: Text("Selecione o sexo"),
value: sexo,
items: ["Masculino", "Feminino", "Outro"]
    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
    .toList(),
onChanged: (value) {
setState(() {
sexo = value;
});
},
),

SizedBox(height: 10),

Row(
children: [
Checkbox(
value: aceitouTermos,
onChanged: (value) {
setState(() {
aceitouTermos = value!;
});
},
),
Text("Aceito os termos de uso")
],
),

SizedBox(height: 20),

ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue,
padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
),
onPressed: validarCampos,
child: Text("Cadastrar", style: TextStyle(color: Colors.white70)),
)
],
),
),
),
);
}
}
