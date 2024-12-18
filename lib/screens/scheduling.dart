import 'package:flutter/material.dart';
import 'package:medlink/screens/reservation_page.dart';
import 'package:medlink/widgets/create_button.dart';
import 'package:medlink/widgets/searchbar_build.dart';

class Scheduling extends StatelessWidget {
  Scheduling({super.key});

  final List<String> _items = [
    "Todas",
    "Alergista e Imunologista",
    "Anestesista",
    "Angiologista e Cirurgião Vascular",
    "Cardiologista",
    "Cirurgião Cardiovascular",
    "Cirurgião Geral",
    "Cirurgião Pediátrico",
    "Clínico Geral",
    "Dermatologista",
    "Endocrinologista",
    "Gastroenterologista",
    "Ginecologista e Obstetra",
    "Neurologista",
    "Oftalmologista",
    "Ortopedista",
    "Otorrinolaringologista",
    "Pediatra",
    "Pneumologista",
    "Psiquiatra",
    "Reumatologista",
    "Urologista"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _bobyScheduling(context));
  }

  Widget _bobyScheduling(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: _titleCenter("AGENDAMENTO")),
      CreateButton.buttonTitle("Selecione uma especialidade", Icons.emergency),
      const Padding(
          padding: EdgeInsets.all(30.0), child: SearchBarBuild()),
      Expanded(child: _createListMeds(context))
    ]);
  }

  Widget _titleCenter(String title) {
    return Center(
        child: Text(title,
            style: const TextStyle(fontSize: 24, color: Colors.blue)));
  }

  Widget _createListMeds(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _addListMeds(context,_items[index]);
        });
  }

  Widget _addListMeds(BuildContext context,String text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blue.shade900),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>ReservationPage(text)));
            },
            child: Row(children: [
              const Icon(Icons.add,
                  color: Colors.white, size: 35),
              Text(text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ])));
  }
}
