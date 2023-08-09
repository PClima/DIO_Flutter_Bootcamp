void main(List<String> arguments) {
  // //int
  // int number1 = 10;
  // var number2 = 11;

  // print("Return true if is a even number");
  // print(number1.isEven);
  // print(number2.isEven);

  // print("Return true if is a odd number");
  // print(number1.isOdd);
  // print(number2.isOdd);

  // print("Return true if is a finite number");
  // print(number1.isFinite);

  // print("Return true if is a infinite number");
  // print(number1.isInfinite);

  // print("Return true if is a negative number");
  // print(number1.isNegative);

  // print("Convert String to Int");
  // print(int.parse("10"));

  // print("Try to convert String to Int if possible");
  // print(int.tryParse("Test"));

  // //Double
  // double number3 = 10.9;
  // var number4 = 11.1;

  // print("Remove floating number");
  // print(number3.truncate());
  // print(number4.truncate());

  // print("Convert Double to Int");
  // print(number3.toInt());
  // print(number4.toInt());

  // print("Round the number up.");
  // print(number3.ceil());
  // print(number4.ceil());

  // print("Round the number down.");
  // print(number3.floor());
  // print(number4.floor());

  // print("Return true if is a valid number");
  // print(number3.isNaN);

  // print("Convert String to Double");
  // print(double.parse("10.2"));
  // print(double.tryParse("Test"));

  // //String
  // String text = "DIO";
  // var text2 = "Flutter Bootcamp";

  // //Check if is empty
  // print(text.isEmpty);
  // print("".isEmpty);
  // print(" ".isEmpty);

  // //Get text length
  // print(text2.length);

  // //Upper and Lower
  // print(text.toLowerCase());
  // print(text2.toUpperCase());

  // //If a String contains in another
  // print(text2.contains(text));
  // print(text2.contains("Flutter"));

  // //Get a piece of String
  // print(text2.substring(5));
  // print(text2.substring(1, 5));

  // //Get a text position
  // print(text2.indexOf("Flutter"));
  // print(text2.indexOf("t"));
  // print(text2.indexOf("@"));

  // //Switch a String to another
  // print(text2.replaceAll("a", "@"));

  // //Split a String from a specific character
  // print(text2.split("a"));
  // print("NOME:TELEFONE:ENDEREÇO".split(":"));

  // //Remove space
  // print(" dio ".trim());
  // print(" dio ".trimLeft());
  // print(" dio ".trimRight());

  // //BOOLEAN - False set as default
  // var varTrue = true;
  // bool varFalse = false;

  // //LIST
  // List<String> lstString = [];
  // var lstInt = [1, 10, 50];
  // List lstDynamic = [];

  // //List Length
  // print(lstString.length);
  // print(lstInt.length);
  // print(lstDynamic.length);

  // //Add item
  // lstString.add("A");
  // lstInt.add(80);
  // lstDynamic.add("B");
  // lstDynamic.add(90);
  // lstDynamic.add(90.6);
  // lstDynamic.add(true);

  // //Remove item
  // lstString.remove("A");

  // //Check if is a empty list
  // print(lstDynamic.isEmpty);
  // print(lstInt.isNotEmpty);

  // //Check if contains a value inside the list
  // print(lstInt.contains(10));

  // //Where Function
  // print(lstInt.where((x) => x > 9 && x < 99));

  // //MAP
  // Map<String, dynamic> map1 = Map<String, dynamic>();
  // var map = {'zero': 0, 'one': 1, 'two': 2};

  // print(map1);
  // print(map);

  // //Get a value by key
  // print(map["one"]);

  // //Add multiple values
  // map.addAll({"ten": 10, "eleven": 11});

  // //Check if is empty
  // print(map1.isEmpty);
  // print(map.isNotEmpty);

  // //Check map length
  // print(map1.length);
  // print(map.length);

  // //Check if contains a key
  // print(map1.containsKey("eleven"));
  // print(map.containsKey("eleven"));

  // //CONST - Constant variables can't be assigned a value
  // const String cnstText = "ABC";

  //DATE TIME
  DateTime data1 = DateTime.now();
  var data2 = DateTime.parse("2022-02-01 01:02:03");

  //Get specific data info
  print(data1);
  print(data1.day);
  print(data1.month);
  print(data1.year);
  print(data2.hour);
  print(data2.microsecond);
  print(data2.second);

  //Get week day
  print(data1.weekday);

  //Sum dates
  data1 = data1.add(Duration(days: 1));
  print(data1.add(Duration(days: 1)));
  print(data1.subtract(Duration(hours: 1)));

  //Compare datas
  print(data1.isAfter(data2));
  print(data1.isBefore(data2));

  //True if after - 0 if is equal - False if before
  print(data1.compareTo(data2));
}
