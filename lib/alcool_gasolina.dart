import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();}

class _MyAppState extends State<MyApp> {
  TextEditingController precoAl = TextEditingController();
  TextEditingController precoGa = TextEditingController();

  var txtResult = "Resultado: ";

  void calcular(){
    double? precoAlcool = double.tryParse(precoAl.text);
    double? precoGasolina = double.tryParse(precoGa.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        txtResult = "Digite um número válido acima de 0 e que tenha (.) ao invés de (,)";
      });
    }else{
      if(precoAlcool/precoGasolina >= 0.7){
        setState(() {
          txtResult = "É melhor abastecer com Gasolina";
        });
      }
      else{
        setState(() {
          txtResult = "É melhor abastecer com Álcool";
        });
      }
    }
  }

  void limparEstados(){
    setState(() {
      txtResult = "";
      precoAl.text = "";
      precoGa.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(        
        
           padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Image.asset("assets/logo.png"),

            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,                
                ),
                ),
              ),

              TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: const InputDecoration(
                  label: Text("Preço Alcool ex: 1.59")
                ),
                controller: precoAl ,
              ),

              TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: const InputDecoration(
                  label: Text("Preço Gasolina ex: 3.59")
                ),
                controller: precoGa,
              ),

              Text(
                  txtResult,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),   


              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(                 
                onPressed: calcular, 
                 style:  ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white                    
                 ),
                child: const Text("Calcular"),
                
                ),
                ),                

                 ElevatedButton(
                    onPressed: limparEstados,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    ), 
                    child: const Text(
                    "Limpar",                
                    )
                  ),

                 
          ],
        ),
        ),      
    );
  }
}