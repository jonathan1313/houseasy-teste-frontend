import 'package:flutter/material.dart';

///
/// cria uma estenção que recupera o tamanho da tela (em pontos)
/// tambem são criados funções que retornao as proporções (em porcentagem)
/// exemplo de utilização da função de porcentagem
/// exp: context.percentWidth(0.25)
/// isso equivale a 25% do total da tela
/// esse metodo não precisa ser inicializado pois é criado atraves do BuildContext
///
extension SizeExtensions on BuildContext {

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;

}