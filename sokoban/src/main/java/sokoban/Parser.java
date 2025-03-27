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
            Set<String> adjacences = new HashSet<>();

            int width = lignes[0].length();
            int height = lignes.length;
            System.out.println("width : " + width);
            System.out.println("height : " + height);
            for (int i = 0; i < height; i++) {
                String ligne = lignes[i];
                for (int j = 0; j < width; j++) {
                    char c = ligne.charAt(i);
                    transformAndBuildPDDL(c, i, j, init, goal, objects);

                    // Gestion des adjacences (évite les doublons)
                    if (i < height - 1) {
                        adjacences.add(String.format("(adjacent pos_%d_%d pos_%d_%d)", i, j, i + 1, j));
                        adjacences.add(String.format("(adjacent pos_%d_%d pos_%d_%d)", i + 1, j, i, j));

                    }

                    if (j < width - 1) {
                        adjacences.add(String.format("(adjacent pos_%d_%d pos_%d_%d)", i, j, i, j + 1));
                        adjacences.add(String.format("(adjacent pos_%d_%d pos_%d_%d)", i, j + 1, i, j));

                    }
                }
            }

            // Ajout des adjacences aux conditions initiales
            for (String adj : adjacences) {
                init.append(adj).append("\n");
            }

            System.out.println("Test Input : \n" + testIn);
            createPDDLFile("p001", init, goal, width, height, objects);

        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de la lecture du fichier JSON !");
        }
    }

    public static void createPDDLFile(String filename, StringBuilder init, StringBuilder goal, int width, int height,
            StringBuilder objects) {
        String pddlContent = String.format("(define (problem %s)\n(:domain %s)\n", filename, Parser.DOMAIN) +
                "(:objects\n";

        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                pddlContent += String.format("pos_%d_%d - position\n", i, j);
                System.out.println(pddlContent.toString());
            }
        }

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

    public static void transformAndBuildPDDL(char element, int col, int lig, StringBuilder init, StringBuilder goal,
            StringBuilder objects) {
        String position = String.format("pos_%d_%d", col, lig);

        switch (element) {
            // Mur
            case '#':
                // à suppr ?
                // init.append("(wall ").append(position).append(")\n");
                init.append("(not (empty ").append(position).append("))\n");
                init.append("(isNotStorage ").append(position).append(")\n");
                break;
            // Boite
            case '$':
                objects.append(String.format("box_%d_%d - box\n", col, lig)); // Ajouter la boîte comme objet
                init.append(String.format("(box_at box_%d_%d %s)\n", col, lig, position));
                init.append("(not (empty ").append(position).append("))\n");
                init.append("(isNotStorage ").append(position).append(")\n");
                init.append(String.format("(box_not_on_storage box_%d_%d)\n", col, lig));
                goal.append(String.format("(box_on_storage box_%d_%d)\n", col, lig));
                break;
            // Destination
            case '.':
                init.append("(isStorage ").append(position).append(")\n");
                init.append("(empty ").append(position).append(")\n");
                // goal.append("(box_at ?b ").append(position).append(")\n");
                break;
            // Boite sur une destination
            case '*':
                objects.append(String.format("box_%d_%d - box\n", col, lig));
                init.append(String.format("(box_at box_%d_%d %s)\n", col, lig, position));
                init.append("(isStorage ").append(position).append(")\n");
                init.append(String.format("(box_on_storage box_%d_%d)\n", col, lig));
                init.append("(not (empty ").append(position).append("))\n");
                goal.append(String.format("(box_on_storage box_%d_%d)\n", col, lig));

                break;
            // Garde mario
            case '@':
                init.append("(at ").append(position).append(")\n");
                init.append("(isNotStorage ").append(position).append(")\n");
                break;
            // Garde sur une place de stockage
            case '+':
                init.append("(at ").append(position).append(")\n");
                init.append("(isStorage ").append(position).append(")\n");
                break;
            // Sol
            case ' ':
                init.append("(empty ").append(position).append(")\n");
                init.append("(isNotStorage ").append(position).append(")\n");
                break;
            default:
                System.out.println("Caractère inconnu : " + element);
                break;
        }
    }

    public static void createPDDLFile(String filename) {
        String pddlContent = String.format("(define (problem %s)\n (:domain %s)\n)", filename, DOMAIN);

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
                System.out.println("OH");
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posRight));
                adjacences.append(String.format("(adjacent %s %s)%n", posRight, pos));
            }
            if (positions.contains(posDown)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posDown));
                adjacences.append(String.format("(adjacent %s %s)%n", posDown, pos));
            }
            if (positions.contains(posLeft)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posLeft));
                adjacences.append(String.format("(adjacent %s %s)%n", posLeft, pos));
            }
            if (positions.contains(posUp)) {
                adjacences.append(String.format("(adjacent %s %s)%n", pos, posUp));
                adjacences.append(String.format("(adjacent %s %s)%n", posUp, pos));
            }
        }
        return adjacences;
    }
}