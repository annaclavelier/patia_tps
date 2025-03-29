package sokoban;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Agent {
    public static void main(String[] args) {
        String sequence = "";
        File file = new File("plan.txt");
        try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            sequence = reader.readLine();
            reader.close();

        } catch (IOException e) {
            System.err.println("Error reading sequence file.");
            e.printStackTrace();
        }

        /* D: down, U: Up, L: Left, R: Right*/
        for (char c : sequence.toCharArray()) System.out.println(c);
    }
}
