package AnimalsClass;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Animals {
    protected String name;
    protected String birthday;
    protected String typeAnimal;
    protected Map<String, String> skill;

    protected Animals(String name, String birthday) {
        this.name = name;
        this.birthday = birthday;
        this.skill = new HashMap<String, String>();
    }

    public String getName() {
        return name;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getTypeAnimal() {
        return typeAnimal;
    }

    public void showSkill() {
        for (String x : skill.keySet()) {
            System.out.println(x);
        }
    }

    public void addSkill() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Введите название команды: ");
        String name = scan.nextLine();
        System.out.println("Что подразумевает команда: ");
        String description = scan.nextLine();
        skill.put(name, description);

    }
}
