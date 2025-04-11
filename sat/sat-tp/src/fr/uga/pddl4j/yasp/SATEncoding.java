package fr.uga.pddl4j.yasp;

import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.problem.Fluent;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.util.BitVector;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/**
 * This class implements a planning problem/domain encoding into DIMACS
 *
 * @author H. Fiorino
 * @version 0.1 - 30.03.2024
 */
public final class SATEncoding {
    /*
     * A SAT problem in dimacs format is a list of int list a.k.a clauses
     */
    private List<Integer> initList = new ArrayList<Integer>();

    /*
     * Goal
     */
    private List<Integer> goalList = new ArrayList<Integer>();

    /*
     * Actions
     */
    private List<Integer> actionPreconditionList = new ArrayList<List<Integer>>();
    private List<Integer> actionEffectList = new ArrayList<List<Integer>>();
    private List<Integer> terminal_actions_List = new ArrayList<>();
    private List<List<Integer>> action_implies_effects = new ArrayList<Integer>();
    private List<List<Integer>> intermediate_action_implies_precond = new ArrayList<List<Integer>>();
    private List<List<Integer>> intermediate_action_implies = new ArrayList<List<Integer>>();
    private List<Integer> intermediate_action_implies_effect = new ArrayList<Integer>();

    /*
     * State transistions
     */
    private HashMap<Integer, List<Integer>> addList = new HashMap<Integer, List<Integer>>();
    private HashMap<Integer, List<Integer>> delList = new HashMap<Integer, List<Integer>>();
    private List<List<Integer>> stateTransitionList = new ArrayList<List<Integer>>();

    /*
     * Action disjunctions
     */
    private List<List<Integer>> actionDisjunctionList = new ArrayList<List<Integer>>();

    /*
     * Current DIMACS encoding of the planning domain and problem for #steps steps
     * Contains the initial state, actions and action disjunction
     * Goal is no there!
     */
    public List<List<Integer>> currentDimacs = new ArrayList<List<Integer>>();

    /*
     * Current goal encoding
     */
    public List<Integer> currentGoal = new ArrayList<Integer>();

    /*
     * Current number of steps of the SAT encoding
     */
    private int steps;

    public SATEncoding(Problem problem, int steps) {

        // initialize empty at first
        initList = new ArrayList<>();
        goalList = new ArrayList<>();

        actionDisjunctionList = new ArrayList<>();
        actionEffectList = new ArrayList<>();
        actionPreconditionList = new ArrayList<>();

        action_implies_effects = new ArrayList<ArrayList<Integer>>();

        this.steps = steps;

        // Encoding of init
        // Each fact is a unit clause
        // Init state step is 1
        // We get the initial state from the planning problem
        // State is a bit vector where the ith bit at 1 corresponds to the ith fluent
        // being true
        final int nb_fluents = problem.getFluents().size();
        System.out.println(" fluents = " + nb_fluents);
        final BitVector init = problem.getInitialState().getPositiveFluents();

        int offset = 0;

        // unit_clause ?

        // TO BE DONE!
        // Construct init list
        int appariment;
        for (int i = 0; i < init.size(); i++) {
            if (init[i] == true) {
                // unit clause
                appariment = pair(i + 1, 1);
                // Add list to init list
                this.initList.add(appariment);
            } else {
                appariment = pair(i + 1, 1);
                // Add list to init list ?
                this.initList.add(appariment);
            }
            offset++;
        }
        // Add init list to current dimacs
        currentDimacs.add(initList);

        // Construct actions
        final List<Action> listActions = problem.getActions();

        for (int step = 0; step < steps; step++) {

            for (int j = 0; j < listActions.size(); j++) {
                intermediate_action_implies_precond = new ArrayList<Integer>();
                intermediate_action_implies_effect = new ArrayList<Integer>();

                int actionEncoding = pair((j + offset + 1), step);
                terminal_actions_List.add(actionEncoding);
                offset++;

                // ugoat nd bigbrainu
                BitVector preconditions = listActions[j].getPreconditions().getPositiveFluents();
                BitVector positiveEffects = listActions[j].getUnconditionalEffect().getPositiveFluents();
                BitVector negativeEffects = listActions[j].getUnconditionalEffect().getNegativeFluents();

                // parcours préconditions
                // all precond positive
                for (int k = 0; k < preconditions.size(); k++) {
                    // on s'intéresse seulement aux préconditions vraies
                    if (preconditions.getBit(k) == 1) {
                        int pairing = pair(k + 1 + offset, step);
                        // actionPreconditionList.add(pairing);
                        ArrayList<Integer> sub_construction_list = new ArrayList<>();
                        sub_construction_list.add(-actionEncoding);
                        sub_construction_list.add(pairing);
                        intermediate_action_implies_precond.add(sub_construction_list);
                    }
                }
                // Incrémenter offset
                offset += preconditions.size();

                // parcours effets positifs
                for (int k = 0; k < positiveEffects.size(); k++) {
                    if (positiveEffects.getBit(k) == 1) {
                        int step_pairing = pair(k + 1 + offset, step);
                        int pairing = pair(k + 1 + offset, step + 1);
                        ArrayList<Integer> sub_construction_list = new ArrayList<>();
                        sub_construction_list.add(-actionEncoding);
                        sub_construction_list.add(pairing);
                        intermediate_action_implies_effect.add(sub_construction_list);

                        if (addList.containsKey(step_pairing)) {
                            addList.get(step_pairing).add(actionEncoding);
                        } else {
                            addList.get(step_pairing).add(step_pairing);
                            addList.get(step_pairing).add(-pairing);
                            addList.put(step_pairing, Arrays.asList(actionEncoding));
                        }
                    }
                }
                // Incrémenter offset
                offset += positiveEffects.size();

                // parcours effets négatifs
                for (int k = 0; k < negativeEffects.size(); k++) {
                    if (listNegEffects.getBit(k) == 1) {
                        int pairing = pair(k + 1 + offset, step + 1);

                        ArrayList<Integer> sub_construction_list = new ArrayList<>();
                        sub_construction_list.add(-actionEncoding);
                        sub_construction_list.add(-pairing);
                        intermediate_action_implies_effect.add(sub_construction_list);

                        // associer effet à liste d'actions
                        if (addList.containsKey(step_pairing)) {
                            delList.get(step_pairing).add(actionEncoding);
                        } else {
                            delList.get(step_pairing).add(step_pairing);
                            delList.get(step_pairing).add(-pairing);
                            delList.put(step_pairing, Arrays.asList(actionEncoding));
                        }
                    }
                }
                // Incrémenter offset
                offset += negativeEffects.size();
            }

            // implication
            for (List<Integer> l : intermediate_action_implies_precond) {
                intermediate_action_implies.add(l);
            }

            for (List<Integer> l : intermediate_action_implies_effect) {
                intermediate_action_implies.add(l);
            }

            // Add the positive effects values to state transition
            for (List<Integer> list : addList.values()) {
                stateTransitionList.add(list);
            }

            // Add the negative effects values to state transition
            for (List<Integer> list : delList.values()) {
                stateTransitionList.add(list);
            }

            // Identify actions ??
            // TODO

            // Alerte, you're not stupid as f, you need to distribute the action to keep the
            // conjunction.
            //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            ///
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// v
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// v
            /// //////////////////////////////////////////////////////////////////////////////////////
            /// v

        }

        // Add to currentDimacs
        for (int i = 0; i < intermediate_action_implies.size(); i++) {
            currentDimacs.add(intermediate_action_implies.get(i));
        }

        for (int i = 0; i < stateTransitionList.size(); i++) {
            currentDimacs.add(stateTransitionList.get(i));
        }

        // Construct goal list
        final BitVector goal = problem.getGoal().getPositiveFluents();
        for (int i = 0; i < goal.size(); i++) {
            if (goal[i] == true) {
                // unit clause
                ArrayList<Integer> arrayList = new ArrayList<>();
                arrayList.add(pair(i + offset + 1, steps));
                // Add list to init list
                this.goalList.add(arrayList);
            } else {
                ArrayList<Integer> arrayList = new ArrayList<>();
                arrayList.add(-pair(i + offset + 1, steps));
                // Add list to init list ?
                this.goalList.add(arrayList);
            }
        }

        currentDimacs.add(goalList);

        // Makes DIMACS encoding from 1 to steps
        // encode(1, steps);
    }

    /*
     * SAT encoding for next step
     */
    public void next() {
        this.steps++;
        encode(this.steps, this.steps);
    }

    public String toString(final List<Integer> clause, final Problem problem) {
        final int nb_fluents = problem.getFluents().size();
        List<Integer> dejavu = new ArrayList<Integer>();
        String t = "[";
        String u = "";
        int tmp = 1;
        int[] couple;
        int bitnum;
        int step;
        for (Integer x : clause) {
            if (x > 0) {
                couple = unpair(x);
                bitnum = couple[0];
                step = couple[1];
            } else {
                couple = unpair(-x);
                bitnum = -couple[0];
                step = couple[1];
            }
            t = t + "(" + bitnum + ", " + step + ")";
            t = (tmp == clause.size()) ? t + "]\n" : t + " + ";
            tmp++;
            final int b = Math.abs(bitnum);
            if (!dejavu.contains(b)) {
                dejavu.add(b);
                u = u + b + " >> ";
                if (nb_fluents >= b) {
                    Fluent fluent = problem.getFluents().get(b - 1);
                    u = u + problem.toString(fluent) + "\n";
                } else {
                    u = u + problem.toShortString(problem.getActions().get(b - nb_fluents - 1)) + "\n";
                }
            }
        }
        return t + u;
    }

    public Plan extractPlan(final List<Integer> solution, final Problem problem) {
        Plan plan = new SequentialPlan();
        HashMap<Integer, Action> sequence = new HashMap<Integer, Action>();
        final int nb_fluents = problem.getFluents().size();
        int[] couple;
        int bitnum;
        int step;
        for (Integer x : solution) {
            if (x > 0) {
                couple = unpair(x);
                bitnum = couple[0];
            } else {
                couple = unpair(-x);
                bitnum = -couple[0];
            }
            step = couple[1];
            // This is a positive (asserted) action
            if (bitnum > nb_fluents) {
                final Action action = problem.getActions().get(bitnum - nb_fluents - 1);
                sequence.put(step, action);
            }
        }
        for (int s = sequence.keySet().size(); s > 0; s--) {
            plan.add(0, sequence.get(s));
        }
        return plan;
    }

    // Cantor paring function generates unique numbers
    private static int pair(int num, int step) {
        return (int) (0.5 * (num + step) * (num + step + 1) + step);
    }

    private static int[] unpair(int z) {
        /*
         * Cantor unpair function is the reverse of the pairing function. It takes a
         * single input
         * and returns the two corespoding values.
         */
        int t = (int) (Math.floor((Math.sqrt(8 * z + 1) - 1) / 2));
        int bitnum = t * (t + 3) / 2 - z;
        int step = z - t * (t + 1) / 2;
        return new int[] { bitnum, step }; // Returning an array containing the two numbers
    }

    private void encode(int from, int to) {
        // crée la formule définitive au solveur de l'étape from à l'étape to
        this.currentDimacs.clear();

        // TO BE DONE!

        System.out.println("Encoding : successfully done (" + (this.currentDimacs.size()
                + this.currentGoal.size()) + " clauses, " + to + " steps)");
    }

}
