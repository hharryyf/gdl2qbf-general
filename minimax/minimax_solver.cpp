#include <bits/stdc++.h>
#include <SWI-Prolog.h>
#include <SWI-cpp2.h>
#include <SWI-cpp2.cpp>
#include <chrono>
std::string player;
std::string otherp;
std::string randp;

std::map<std::vector<std::string>, std::pair<int, int>> table;
/*
    swipl-ld -goal true -o minimax_solver -ld g++ -g -O minimax_solver.cpp
    
    command line arguments
    ./minimax_solver [game prolog file] [player name] [depth]
*/ 
int cnt = 0, add_cnt = 0, remove_cnt = 0, iteration = 0, remove_state = 0;
bool role_ok() {
    PlTermv av(1);
    PlQuery q("role", av);
    std::set<std::string> role;
    try {
        while(q.next_solution() ) {    
            role.insert(av[0].as_string());
        }

        q.cut();
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << ex.what() << std::endl;
    }

    std::cout << player << " " << otherp << " " << randp << std::endl;
    if (role.find(player) == role.end()) return false;
    if (otherp != "" && role.find(otherp) == role.end()) return false;
    if (randp != "" && role.find(randp) == role.end()) return false;

    return ((int) role.size() >= 2) && ((int) role.size() <= 3); 
}

std::tuple<std::set<std::string>,std::set<std::string>,std::set<std::string>> get_legal() {
    PlTermv av(2);
    PlQuery q("legal", av);
    std::set<std::string> our;
    std::set<std::string> opponent;
    std::set<std::string> rndp;
    try {
        while(q.next_solution() ) {    
            //std::cout << "get legal " << av[0].as_string() << " " << av[1].as_string() << std::endl;
            if (av[0].as_string() ==player) {
                our.insert(av[1].as_string());
            } else if (av[0].as_string() == otherp) {
                opponent.insert(av[1].as_string());
                // other_name = av[0].as_string();
            } else {
                rndp.insert(av[1].as_string());
                // other_name = av[0].as_string();
            }
        } 

        q.cut();
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in legal " << ex.what() << std::endl;
    }


    return std::make_tuple(our, opponent, rndp);
}

bool is_terminal() {
    PlTermv av(0);
    PlQuery q("terminal", av);
    try {
        while (q.next_solution()) {
            return true;
        }

        q.cut();
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in terminal " << ex.what() << std::endl;
    }
    return false;
}

int get_reward() {
    
    int curr = -1;
    PlTermv av(2);
    PlQuery q("goal", av);
    try {
        while (q.next_solution()) {
            if (av[0].as_string() == player) {
                curr = atoi(av[1].as_string().c_str());
                break;
            }
        }

        q.cut();
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in reward " <<  ex.what() << std::endl;
    }


    if (curr == -1) {
        printf("bad\n");
        exit(1);
    }
    return curr;
}

std::vector<std::string> query_next() {
    std::vector<std::string> result;
    std::set<std::string> st;

    PlTermv av(1);
    PlQuery q("next", av);
    
    try {
        while (q.next_solution()) {
            std::string curr = std::string("true(").append(av[0].as_string()).append(")");
            st.insert(curr);
        }

        q.cut();
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << "in next " <<  ex.what() << std::endl;
    }    


    for (auto &s : st) result.push_back(s);
    
    return result;
}

std::vector<std::string> query_init() {
    std::vector<std::string> result;
    std::set<std::string> st;

    PlTermv av(1);
    PlQuery q("init", av);
    
    try {
        while (q.next_solution()) {
            std::string curr = std::string("true(").append(av[0].as_string()).append(")");
            st.insert(curr);
        }

        q.cut();
    } catch ( PlExceptionBase &ex ) { 
        std::cerr << ex.what() << std::endl;
        exit(1);
    }    

    for (auto &s : st) result.push_back(s);

    return result;
}

void add_facts(std::vector<std::string> &facts) {
    for (auto &s : facts) {
        //std::cout << "add fact: " << s << std::endl;
        std::string res = "assertz(";
        res.append(s);
        res.append(")");
        try {
            add_cnt++;
            if (!PlCall(res)) {
                std::cerr << "Error Add!" << std::endl;
            }
        } catch ( PlExceptionBase &ex ) { 
            std::cerr << "in add " << ex.what() << " " << res << std::endl;
            exit(1);
        }
    }
}

void remove_facts(std::vector<std::string> &facts) {
    for (auto &s : facts) {
        //std::cout << "remove fact: " << s << std::endl;
        std::string res = "retractall(";
        res.append(s);
        res.append(")");
        try {
            remove_cnt++;
            //PL_STRINGS_MARK();
            if (!PlCall(res)) {
                std::cerr << "Error retract!" << std::endl;
            }
            
            //PL_STRINGS_RELEASE();
        }
        catch ( PlException &ex ) { 
            std::cerr << "in remove " << ex.what() << " " << res << std::endl;
            exit(1);
        }
    }
}

int minimax(int depth, std::vector<std::string> &s_true, char *argv[]) {
    if (cnt > 20000) {
        cnt = 0;
        Plx_cleanup(1);
        Plx_initialise(2, argv);
    }
    add_facts(s_true);
    
    
    ++cnt;
    ++iteration;
    // if (cnt % 1000 == 0) std::cout << iteration << " tt: " << table.size() << " " << add_cnt << " " << remove_cnt << " " << add_cnt - remove_cnt << std::endl;
    

    if (is_terminal()) {
        int rew = get_reward();
        
        remove_facts(s_true);
        
        if (rew == 100) return 1;
        return 0;
    }

    if (table.find(s_true) != table.end()) {
        auto entry = table[s_true];
        if (entry.first >= depth || entry.second == 1) {
            
            remove_facts(s_true);
            
            return entry.second;
        }
    }

    if (depth == 0) {
        
        remove_facts(s_true);
        
        return 0;
    }

    auto legals = get_legal();
    auto x_move = std::get<0>(legals);
    auto o_move = std::get<1>(legals);
    auto rd_move = std::get<2>(legals);
    //std::cout << x_move.size() << " " << o_move.size() << " " << rd_move.size() << std::endl;
    remove_facts(s_true);

    if (x_move.empty() || (o_move.empty() && otherp != "") || (rd_move.empty() && randp != "")) {
        std::cerr << "The game is not playable!" << std::endl;
        exit(1);
    }
    
    int reward = 0;

    std::vector<std::string> actions;
    
    if (otherp != "" && randp != "") {
        for (auto &x_mv : x_move) {
            actions.push_back("does(" + player + "," +  x_mv + ")");
            int reward1 = 1;
            for (auto &o_mv : o_move) {
                actions.push_back("does(" + otherp + "," +  o_mv + ")");
                int reward2 = 1;
                for (auto &rd_mv : rd_move) {
                    actions.push_back("does(" + randp + "," +  rd_mv + ")");
                    add_facts(actions);
                    add_facts(s_true);
                    auto s_next = query_next();
                    remove_facts(s_true);
                    remove_facts(actions);
                    reward2 = std::min(reward2, minimax(depth - 1, s_next, argv));
                    actions.pop_back();
                    if (reward2 == 0) {
                        break;
                    }
                }
                reward1 = std::min(reward1, reward2);
                actions.pop_back();

                if (reward1 == 0) {
                    break;
                }
            }

            actions.pop_back();
            
            reward = std::max(reward, reward1);
            
            if (reward == 1) break;
        }
    } else if (otherp != "") {
        for (auto &x_mv : x_move) {
            actions.push_back(std::string("does(" + player + "," +  x_mv + ")"));
            int reward1 = 1.0;
            for (auto &o_mv : o_move) {
                actions.push_back(std::string("does(" + otherp + "," +  o_mv + ")"));
                add_facts(actions);
                add_facts(s_true);
                auto s_next = query_next();
                remove_facts(s_true);
                remove_facts(actions);
                reward1 = std::min(reward1, minimax(depth - 1, s_next, argv));
                actions.pop_back();
                
                if (reward1 == 0) {
                    break;
                }
            }

            actions.pop_back();
            
            reward = std::max(reward, reward1);
            
            if (reward == 1) break;
        }
    } else {
        for (auto &x_mv : x_move) {
            actions.push_back("does(" + player + "," +  x_mv + ")");
            int reward2 = 1;
            for (auto &rd_mv : rd_move) {
                actions.push_back("does(" + randp + "," +  rd_mv + ")");
                add_facts(actions);
                add_facts(s_true);
                auto s_next = query_next();
                remove_facts(s_true);
                remove_facts(actions);
                reward2 = std::min(reward2, minimax(depth - 1, s_next, argv));
                actions.pop_back();
                if (reward2 == 0) break;
            }

            actions.pop_back();
            
            reward = std::max(reward, reward2);
            
            if (reward == 1) break;
        }
    }

    if (table.size() >= 1000000) {
        while ((int) table.size() >= 500000) {
            auto v = *table.begin();
            table.erase(v.first);
        }

        remove_state += 500000;
    }

    if (table.find(s_true) == table.end()) {
        table[s_true] = std::make_pair(depth, reward);
    } else {
        if (reward == 1.0) {
            table[s_true] = std::make_pair(depth, reward);
        } else {
            auto entry = table[s_true];
            if (entry.first < depth) {
                table[s_true] = std::make_pair(depth, reward);
            }
        }
    }
    
    
    return reward;
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        std::cerr << "Usage: ./minimax_solver [game prolog file] [player_name,adversarial_name,random_name] [depth]" << std::endl;
        exit(1);
    }

    

    Plx_initialise(2, argv);
    int depth = atoi(argv[3]);
    std::string tmp;
    cnt = 0;
    for (int i = 0 ; i < strlen(argv[2]); ++i) {
        if (argv[2][i] == ',') {
            ++cnt;
            if (cnt == 1) {
                player = tmp;
            } else if (cnt == 2) {
                otherp = tmp;
            }
            tmp = "";
        } else {
            tmp.push_back(argv[2][i]);
        }
    }

    randp = tmp;
    
    if (cnt != 2) {
        std::cerr << "wrong player format! Should be [player,opponent,random] and at least one of opponent and random is not empty" << std::endl;
        exit(1);
    }

    // game description is invalid
    if (!role_ok()) {
        std::cerr << "Incorrect role names or the game is not a game with at least 2 players" << std::endl;
        exit(1);
    }

    cnt = 0;
    auto s_init = query_init();
    //clock_t start = clock();
    auto start = std::chrono::steady_clock::now();
    auto res = minimax(depth, s_init, argv);
    //clock_t end = clock();
    auto end = std::chrono::steady_clock::now();
    std::chrono::duration<double> tt = end - start;
    printf("Nodes: %d, Time: %.2lfs, nps: %.2lf, TT size: %d\n", iteration, tt.count(), round(1.0 * iteration / tt.count()), remove_state + (int) table.size());
    std::cout << std::endl;
    std::cout << (res ? "WIN" : "CANNOT WIN") << std::endl;
    PL_halt(0);
    return 0;
}
