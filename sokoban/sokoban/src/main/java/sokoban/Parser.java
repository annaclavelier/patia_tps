package sokoban;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Parser {
    final static String DOMAIN = "sokoban";

    /* 
    public static void main(String[] args) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            File jsonFile = Paths.get(System.getProperty("user.dir"), "sokoban", "sokoban", "config", "test0.json")
                    .toFile();
            if (!jsonFile.exists()) {
                System.err.println("Erreur : Le fichier JSON n'existe pas !");
                return;
            }

            JsonNode rootNode = objectMapper.readTree(jsonFile);
            String testIn = rootNode.path("testIn").asText();
            if (testIn.isEmpty()) {
                System.err.println("Erreur : 'testIn' est vide dans le fichier JSON !");
                return;
            }

            String[] lignes = testIn.split("\n");

            StringBuilder init = new StringBuilder();
            StringBuilder goal = new StringBuilder();
            StringBuilder objects = new StringBuilder();
            HashSet<String> positions = new HashSet<>();

            int width = lignes[0].length();
            int height = lignes.length;
            System.out.println("width : " + width);
            System.out.println("height : " + height);
            for (int i = 0; i < height; i++) {
                String ligne = lignes[i];
                for (int j = 0; j < width; j++) {
                    char c = ligne.charAt(i);
                    transformAndBuildPDDL(c, i, j, init, goal, objects, positions);
                }
            }

            // Ajout des adjacences
            StringBuilder adjacences = generateAdjacences(positions);
            init.append(adjacences);

            System.out.println("Test Input : \n" + testIn);
            createPDDLFile("p001", init, goal, width, height, objects);

        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de la lecture du fichier JSON !");
        }
    }
    */

    public static void createPDDLFile(String filename, StringBuilder init, StringBuilder goal,
            StringBuilder objects) {
        String pddlContent = String.format("(define (problem %s)%n(:domain %s)%n", filename, Parser.DOMAIN) +
                "(:objects\n";


        pddlContent += objects.toString();

        pddlContent += ")\n(:init\n";
        pddlContent += init.toString();
        pddlContent += ")\n(:goal (and\n";
        pddlContent += goal.toString();
        pddlContent += ")))";

        // Écriture dans le fichier
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename + ".pddl"))) {
            writer.write(pddlContent);
            System.out.println("Fichier PDDL généré : " + filename + ".pddl");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void transformAndBuildPDDL(char element, int x, int y, StringBuilder init, StringBuilder goal,
            StringBuilder objects, Set<String> positions) {
        String position = String.format("pos_%d_%d", x, y);

        switch (element) {
            // Mur
            case '#':
                break;
            // Boite
            case '$':
                objects.append(String.format("box_%d_%d - box%n", x, y)); // Ajouter la boîte comme objet
                objects.append(position + " - position\n");
                positions.add(position);
                init.append(String.format("(box_at box_%d_%d %s)%n", x, y, position));
                init.append("(isNotStorage ").append(position).append(")\n");
                init.append(String.format("(box_not_on_storage box_%d_%d)%n", x, y));
                goal.append(String.format("(box_on_storage box_%d_%d)%n", x, y));
                break;
            // Destination
            case '.':
                objects.append(position + " - position\n");
                positions.add(position);
                init.append("(empty ").append(position).append(")\n");
                init.append("(isStorage ").append(position).append(")\n");
                break;
            // Boite sur une destination
            case '*':
                objects.append(position + " - position\n");
                positions.add(position);
                objects.append(String.format("box_%d_%d - box%n", x, y));
                init.append(String.format("(box_at box_%d_%d %s)%n", x, y, position));
                init.append("(isStorage ").append(position).append(")\n");
                init.append(String.format("(box_on_storage box_%d_%d)%n", x, y));
                goal.append(String.format("(box_on_storage box_%d_%d)%n", x, y));
                break;
            // Garde mario
            case '@':
                objects.append(position + " - position\n");
                positions.add(position);
                init.append("(at ").append(position).append(")\n");
                init.append("(isNotStorage ").append(position).append(")\n");
                break;
            // Garde sur une place de stockage
            case '+':
                objects.append(position + " - position\n");
                positions.add(position);
                init.append("(at ").append(position).append(")\n");
                init.append("(isStorage ").append(position).append(")\n");
                break;
            // Sol
            case ' ':
                objects.append(position + " - position\n");
                positions.add(position);
                init.append("(empty ").append(position).append(")\n");
                init.append("(isNotStorage ").append(position).append(")\n");
                break;
            default:
                System.out.println("Caractère inconnu : " + element);
                break;
        }
    }

    public static void createPDDLFile(String filename) {
        String pddlContent = String.format("(define (problem %s)%n (:domain %s)%n)", filename, DOMAIN);

        // Écriture dans le fichier
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename + ".pddl"))) {
            writer.write(pddlContent);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static StringBuilder generateAdjacences(Set<String> positions) {
        StringBuilder adjacences = new StringBuilder();

        for (String pos : positions) {
            String[] coords = pos.split("_");
            int x = Integer.parseInt(coords[1]);
            int y = Integer.parseInt(coords[2]);
            System.out.println("x:" + x + ", y:" + y + "\n");

            // Vérifier les voisins possibles
            String posRight = String.format("pos_%d_%d", x + 1, y);
            String posDown = String.format("pos_%d_%d", x, y + 1);
            String posLeft = String.format("pos_%d_%d", x - 1, y);
            String posUp = String.format("pos_%d_%d", x, y - 1);
            System.out.println(posRight + " " + posDown + " " + posLeft + " " + posUp);

            // Ajouter les relations si les positions existent
            if (positions.contains(posRight)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posRight));
            }
            if (positions.contains(posDown)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posDown));
            }
            if (positions.contains(posLeft)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posLeft));
            }
            if (positions.contains(posUp)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posUp));
            }
        }
        return adjacences;
    }
}