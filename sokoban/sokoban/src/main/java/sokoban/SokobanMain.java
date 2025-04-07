package sokoban;

import java.io.*;
import java.nio.file.Paths;
import java.util.HashSet;

import com.codingame.gameengine.runner.SoloGameRunner;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


public class SokobanMain {
    public static void main(String[] args) {

        // Json file tests should be in .config/ directory
        // Default test case
        String testName = "test11.json";
        String pddlFileName = "p0011.pddl";
        String planFileName = "plan.txt";
        // Default timeout
        int timeout = 600;

        if (args.length > 0 ){
            testName="test"+args[0]+".json";
            pddlFileName = "p00"+args[0]+".pddl";
            if (args.length > 1){
                timeout = Integer.parseInt(args[1]);
            }
        }
        
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            File jsonFile = Paths.get(System.getProperty("user.dir"), "config", testName)
                    .toFile();
            //System.out.println(jsonFile.getPath());
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

            // Créer le fichier PDDL
            ParserJson.createPDDLFile(pddlFileName, init, goal, objects);

        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de la lecture du fichier JSON !");
        }

        // Chemins par défaut
        String jarPath = "./pddl4j-4.0.0.jar"; // Modifier selon l'emplacement du JAR
        String solverClass = "fr.uga.pddl4j.planners.statespace.HSP"; // HSP par défaut
        String domainFile = "domain.pddl";
        String problemFile = pddlFileName;

        // Generate plan and parse plan
        executeSolver(jarPath, solverClass, domainFile, problemFile, timeout);

        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent.class);


        /* charger l'espace de jeu */
        gameRunner.setTestCase(testName);

        gameRunner.start(4200);

    }

    private static void executeSolver(String jarPath, String solverClass, String domainFile, String problemFile,
            int timeout) {
        try {
            // Construire la commande
            ProcessBuilder processBuilder = new ProcessBuilder(
                    "java", "-cp", jarPath, "-server", "-Xms2048m", "-Xmx2048m",
                    solverClass, domainFile, problemFile, "-t", String.valueOf(timeout));
                    System.out.println("pbm file "+problemFile);

            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();

            // Lire la sortie du solveur
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuilder output = new StringBuilder();
            String line;
            boolean planFound = false;

            while ((line = reader.readLine()) != null) {
               System.out.println(line); // Affichage en direct
                output.append(line).append("\n");

                if (line.contains("found plan as follows:")) {
                    planFound = true;
                }
            }

            int exitCode = process.waitFor();
            //System.out.println("Process exited with code: " + exitCode);

            if (planFound) {
                System.out.println(output.toString());
                String solution = ParserPlan.parsePlan(output.toString());
                saveSolution(solution);
                System.out.println("sequence trouvée :"+solution);
            } else {
                System.out.println("No plan found or an error occurred.");
            }

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    private static void saveSolution(String output) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("plan.txt"));
            boolean capture = false;
            writer.write("");

            writer.write(output);

            writer.close();
           // System.out.println("Plan saved in plan.txt");
        } catch (IOException e) {
            System.err.println("Error writing plan file.");
            e.printStackTrace();
        }
    }
}
