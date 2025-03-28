package sokoban;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ParserPlan {
    public static void main(String[] args) {
        String planFile = "plan.txt";  // Nom du fichier contenant le plan PDDL
        String sequence = parsePlan(planFile);
        System.out.println("Converted Sequence: " + sequence);
    }

    public static String parsePlan(String fileName) {
        StringBuilder sequence = new StringBuilder();
        File file = new File(fileName);

        if (!file.exists()) {
            System.err.println("Error: File not found - " + file.getAbsolutePath());
            return "";
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            // Pattern pour capturer les actions
            Pattern simpleMovePattern = Pattern.compile("\\(\\s*(deplacement_(ligne|colonne))\\s+(\\S+)\\s+(\\S+)\\s*\\)");
            Pattern pushMovePattern = Pattern.compile("\\(\\s*(pousser_caisse_\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s*\\)");

            while ((line = reader.readLine()) != null) {
                Matcher simpleMoveMatcher = simpleMovePattern.matcher(line);
                Matcher pushMoveMatcher = pushMovePattern.matcher(line);

                if (simpleMoveMatcher.find()) {
                    // Mouvement simple (Sokoban se déplace)
                    String action = simpleMoveMatcher.group(1);
                    String start = simpleMoveMatcher.group(3);
                    String end = simpleMoveMatcher.group(4);
                    String move = determineMove(action, start, end);
                    if (move != null) {
                        sequence.append(move);
                    }
                } else if (pushMoveMatcher.find()) {
                    // Mouvement de poussée de caisse
                    String action = pushMoveMatcher.group(1);
                    String box = pushMoveMatcher.group(2);
                    String sokobanStart = pushMoveMatcher.group(3);
                    String boxStart = pushMoveMatcher.group(4);
                    String boxEnd = pushMoveMatcher.group(5);
                    String move = determinePushMove(action, sokobanStart, boxStart, boxEnd);
                    if (move != null) {
                        sequence.append(move);
                    }
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading the file: " + file.getAbsolutePath());
            e.printStackTrace();
        }

        return sequence.toString();
    }

    private static String determineMove(String action, String start, String end) {
        int x1 = getX(start), y1 = getY(start);
        int x2 = getX(end), y2 = getY(end);

        if (action.equals("deplacement_colonne")) {
            return (y2 > y1) ? "D" : "U";
        } else if (action.equals("deplacement_ligne")) {
            return (x2 > x1) ? "R" : "L";
        }
        return null;
    }

    private static int getX(String position) {
        return Integer.parseInt(position.split("_")[1]);
    }

    private static int getY(String position) {
        return Integer.parseInt(position.split("_")[2]);
    }

    private static String determinePushMove(String action, String sokobanStart, String boxStart, String boxEnd) {
        int xB1 = getX(boxStart), yB1 = getY(boxStart);
        int xB2 = getX(boxEnd), yB2 = getY(boxEnd);

        if (xB2 > xB1) return "L"; // Push Right
        if (xB2 < xB1) return "R"; // Push Left
        if (yB2 > yB1) return "U"; // Push Down
        if (yB2 < yB1) return "D"; // Push Up

        return null;
    }

}
