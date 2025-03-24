package sokoban;

import com.codingame.gameengine.runner.SoloGameRunner;

public class SokobanMain {
    public static void main(String[] args) {
        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent.class);
        /* charger l'espace de jeu */
        gameRunner.setTestCase("test0.json");

        gameRunner.start(4200);
                
    }
}
