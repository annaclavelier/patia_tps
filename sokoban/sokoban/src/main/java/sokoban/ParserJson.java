package sokoban;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Set;


public class ParserJson {
    final static String DOMAIN = "sokoban";

    public static void createPDDLFile(String filename, StringBuilder init, StringBuilder goal,
            StringBuilder objects) {
        String pddlContent = String.format("(define (problem %s)%n(:domain %s)%n", filename, ParserJson.DOMAIN) +
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
                adjacences.append(String.format("(ligne %s %s)%n", pos, posRight));
            }
            if (positions.contains(posDown)) {
                adjacences.append(String.format("(colonne %s %s)%n", pos, posDown));
            }
            if (positions.contains(posLeft)) {
                adjacences.append(String.format("(ligne %s %s)%n", pos, posLeft));
            }
            if (positions.contains(posUp)) {
                adjacences.append(String.format("(colonne %s %s)%n", pos, posUp));
            }
        }
        return adjacences;
    }
}