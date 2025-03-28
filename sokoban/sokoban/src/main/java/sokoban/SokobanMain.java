package sokoban;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashSet;

import com.codingame.gameengine.runner.SoloGameRunner;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SokobanMain {
    public static void main(String[] args) {

        // Json file tests should be in .config/ directory
        String testName = "test1.json";
        String pddlFileName = "p002";

       try {
            ObjectMapper objectMapper = new ObjectMapper();
            File jsonFile = Paths.get(System.getProperty("user.dir"), "config", testName)
                    .toFile();
            System.out.println(jsonFile.getPath());
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
            HashSet<String> positions =  new HashSet<>();

            int height = lignes.length;

            for (int y = 0; y < height; y++) {
                String ligne = lignes[y];
                for (int x = 0; x < ligne.length(); x++) {

                    char c = ligne.charAt(x);
                    ParserJson.transformAndBuildPDDL(c, x, y, init, goal, objects, positions);
                }
            }

            // Ajout des adjacences
            StringBuilder adjacences = ParserJson.generateAdjacences(positions);
            init.append(adjacences);
       
            // create file
            ParserJson.createPDDLFile(pddlFileName, init, goal,objects);

        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de la lecture du fichier JSON !");
        }
         
        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent.class);
        //gameRunner.setAgent("DUU");
        /* charger l'espace de jeu */
        gameRunner.setTestCase(testName);

        gameRunner.start(4200);
                
    }
}
