void main(List<String> arguments) {
  printName("Pedro", sobrenome: "Lima");
}

void printName(String name, {String? sobrenome}) {
  if (sobrenome != null) {
    print("My name is: $name $sobrenome");
  } else {
    print("My name is: $name");
  }
}
