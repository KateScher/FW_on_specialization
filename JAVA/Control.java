import java.util.ArrayList;
import java.util.Scanner;

import AnimalsClass.Animals;
import AnimalsClass.Cat;
import AnimalsClass.Dog;

public class Control {
    public static int command;
    public static ArrayList<Animals> animalsList = new ArrayList<>();
    public static String menu = """
             1. Посмотреть всех животных
             2. Добавить животное
             3. Oбучить живoтное
             4. Посмотреть команды
             5. Выйти
            """;

    public static void main(String[] args) {
        Counter counter = new Counter();

        Scanner scan = new Scanner(System.in);
        while (command != 5) {
            System.out.println("Количество животных в питомнике : " + counter.getIndex());
            System.out.println(menu);
            System.out.println("Введите действие из меню: ");
            command = Integer.parseInt(scan.nextLine());
            switch (command) {
                case 1 -> showListAnimal();
                case 2 -> addAnimal(animalsList, counter);
                case 3 -> addSkill(animalsList);
                case 4 -> showSkill(animalsList);

            }

        }

    }

    public static void addAnimal(ArrayList<Animals> animalsList, Counter couter) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Введите имя нового животного: ");
        String name = scan.nextLine();
        System.out.println("Введите дату рождения животного: ");
        String birthday = scan.nextLine();
        System.out.println("Введите вид животного:" +
                "\n 1. Кошка " +
                "\n 2. Собака");

        command = Integer.parseInt(scan.nextLine());
        switch (command) {
            case 1 -> animalsList.add(new Cat(name, birthday));
            case 2 -> animalsList.add(new Dog(name, birthday));

        }
        if (!name.equals("") & !birthday.equals("")) {
            couter.addIndex();
        }
    }

    public static void showListAnimal() {
        System.out.println("Количество животных на сегодня: ");
        if (animalsList.size() > 0) {
            int i = 1;
            for (Animals x : animalsList) {
                System.out.print(i + ". " + x.getName() + " " + x.getBirthday() + " " + x.getTypeAnimal() + " |");
                i += 1;
            }
            System.out.println();
        } else
            System.out.println("Реестр пуст");
    }

    public static void addSkill(ArrayList<Animals> animalsList) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Укажите номер животного которого хотите обучить");
        int numberAnimal = scan.nextInt() - 1;
        animalsList.get(numberAnimal).addSkill();
    }

    public static void showSkill(ArrayList<Animals> animalsList) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Укажите номер животного, команды которого хотите: ");
        int numberAnimal = scan.nextInt() - 1;
        animalsList.get(numberAnimal).showSkill();
    }
}
