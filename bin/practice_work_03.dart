import 'dart:io';

void main() {
//   1)Необходимо написать программу, которая
// 1)  Регистрация по логину и паролю
// 2) проверяет правильность введения пароля.
// При введении правильного пароля необходимо вывести “Верный пароль”
// При введении неверного пароля необходимо вывести “Повторите ввод ” и запрашивать ввод пароля
  Map<String, String> users = {'aktan': 'aktan123'};

  void singUp() {
    print('----Sing Up----');
    stdout.write("Введите логин: ");
    String login = stdin.readLineSync() ?? '';

    if (users.containsKey(login)) {
      print("Пользователь с таким логином уже существует.");
      return;
    }

    stdout.write("Введите пароль: ");
    String password = stdin.readLineSync() ?? '';

    users[login] = password;
    print("Добро пожаловать $login");
  }

  void singIn() {
    print('----Sing In----');
    stdout.write("Введите логин: ");
    String login = stdin.readLineSync() ?? '';

    if (!users.containsKey(login)) {
      print("Пользователь с таким логином не найден.");
      singUp();
    }

    stdout.write("Введите пароль: ");
    String password = stdin.readLineSync() ?? '';

    if (users[login] == password) {
      print("Добро пожаловать $login");
    } else {
      print("вы ввели неправильный пароль, повторите ввод :");
      singIn();
    }
  }

  void chooseWay() {
    stdout.write(
        "Введите 1 если хотите 'Войти' и 2 если хотите 'Зарегистрироваться': ");
    int myChoose = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (myChoose == 1) {
      singIn();
    } else if (myChoose == 2) {
      singUp();
    } else {
      stdout.write(
          "вы ввели неправильное значение, введите 1 если хотите 'Войти' и 2 если хотите 'Зарегистрироваться' : ");
      chooseWay();
    }
  }

  // chooseWay();

// 2)Организовать беспрерывный ввод чисел с клавиатуры, пока пользователь не введёт 0.
// После ввода нуля, показать на экран количество чисел, которые были введены, их общую сумму и среднее арифметическое.
// Подсказка: необходимо объявить переменную-счетчик, которая будет считать количество введенных чисел, и переменную,
// которая будет накапливать общую сумму чисел.
  int count = 0;
  double sum = 0.0;

  while (true) {
    stdout.write("Введите число (или 0 для завершения): ");
    double number = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
    if (number == 0.0) {
      break;
    }
    count++;
    sum += number;
  }
  print("Количество чисел: $count");
  print("Общая сумма: $sum");
  print("Среднее арифметическое: ${sum / count}");

  // 3)Необходимо суммировать все нечётные целые числа в диапазоне, который введёт пользователь с клавиатуры.

  stdout.write('Введите начало диапазона:');
  int start = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write('Введите конец диапазона:');
  int end = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  int rangeSum = 0;
  for (int i = start; i <= end; i++) {
    if (i % 2 != 0) {
      rangeSum += i;
    }
  }
   print('Сумма нечётных чисел в диапазоне от $start до $end: $rangeSum');
}
