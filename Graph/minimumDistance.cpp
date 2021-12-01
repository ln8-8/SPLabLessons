#include <iostream>
#include <algorithm>
#include <vector>
#include <limits.h>
#include <fstream>
#include <queue>
#include <cerrno>

void minimumDistanceOfGraph(int source, int destination, 
		int& best, int& sum, std::vector<int>& used, 
		std::vector<int>& distance, std::vector<std::vector<int>>& minDist, 
		std::vector<std::vector<std::pair<int, int>>>& adjacentNodes,
		std::vector<int>& minDistForDest) {
    used[source] = 1;
    distance.push_back(source);
    if(sum + minDistForDest[source] == best) {
        if (source == destination && sum == best) {
             minDist.push_back(distance);
	}
        else {
            for (int i = 0; i < adjacentNodes[source].size(); i++) {
                int node = adjacentNodes[source][i].first;
                int weight = adjacentNodes[source][i].second;
                if (used[node]) {
                    continue;
		}
                sum += weight;
                minimumDistanceOfGraph(node, destination, best, sum, used, distance, minDist, adjacentNodes,minDistForDest);
                sum -= weight;
            }
        }
    }

    used[source] = 0;
    distance.pop_back();
}

std::vector<std::vector<int>> minDistanceUtility(int& source, int& destination, 
		int& numberOfNodes, int& best, 
		std::vector<std::vector<std::pair<int, int>>>& adjacentNodes, 
		std::vector<int>& minDistsForDest) {
    int sum = 0;
    std::vector<int> used(numberOfNodes + 1);
    std::vector<int> distance;
    std::vector<std::vector<int>> minDist;

    minimumDistanceOfGraph(source, destination, best, sum, used, distance, minDist, adjacentNodes, minDistsForDest);
    return minDist;
}

std::vector<int> djikstra(int source, int destination, int numberOfNodes, std::vector<std::vector<std::pair<int, int>>>& adjacentNodes)
{
    std::vector<int> used(numberOfNodes + 1), dist(numberOfNodes + 1, -1);
    std::priority_queue<std::pair<int, int>> q;
    q.push({ 0,destination });
    dist[destination] = 0;
    while (!q.empty())
    {
        int node;
        do
        {
            node = q.top().second;
            q.pop();
        } while (!q.empty() && used[node]);

        if (used[node])
            break;
        used[node] = 1;
        for (int i = 0; i < adjacentNodes[node].size(); i++)
        {
            int to = adjacentNodes[node][i].first;
            int weight = adjacentNodes[node][i].second;
            if (dist[to] == -1 || dist[to] > dist[node] + weight)
            {
                dist[to] = dist[node] + weight;
                q.push({ -dist[to], to });
            }
        }

    }
    return dist;
}


void print(std::vector<std::vector<int>> minimumOfDistances, int best) {
    if (minimumOfDistances.size() == 0) {
      std::cout << "There is no way from source to destination" << std::endl;
    }
    else {
        std::cout << "The shortest distance is " << best << std::endl;
        for (int i = 0; i < minimumOfDistances.size(); i++) {
            for (int j = 0; j < minimumOfDistances[i].size(); j++) {
                std::cout << minimumOfDistances[i][j] << " ";
            }
            std::cout << std::endl;
        }
    }
}

int main(int argc, char** argv) {
    int sum = 0;
    int numberOfNodes, numberOfEdges;
    int sourceNode, destinationNode;

    if(argc == 1) {
	    std::cerr << "You have to input a file" << std::endl;
	    exit(errno);
    }
    else if(argc > 2) {
	    std::cerr << "Wrong amount of arguments" << std::endl;
	    exit(errno);
    }

    std::ifstream input;
    input.open(argv[1]);

    if(input.fail()) {
        std::cerr << "There is no such file" << std::endl;
        exit(1);
    }

    input >> numberOfNodes >> numberOfEdges;
    std::vector<std::vector<std::pair<int, int>>> adjacentNodes(numberOfNodes + 1);

    for (int i = 0; i < numberOfEdges; i++) {
        int firstNode, secondNode, weight;
        input >> firstNode >> secondNode >> weight;
        if (firstNode > numberOfNodes || secondNode > numberOfNodes) {
            std::cerr << "Wrong amount of nodes" << std::endl;
	    exit(errno);
        }
        adjacentNodes[firstNode].push_back(std::make_pair(secondNode, weight));
        adjacentNodes[secondNode].push_back(std::make_pair(firstNode, weight));
    }

    input >> sourceNode >> destinationNode;
	
    std::vector<int> minDistsForDest = djikstra(sourceNode, destinationNode, numberOfNodes, adjacentNodes);
    int best = minDistsForDest[sourceNode];

    std::vector<std::vector<int>> minimumOfDistances = minDistanceUtility(sourceNode, destinationNode, numberOfNodes, best, adjacentNodes, minDistsForDest);

    print(minimumOfDistances, best);

    input.close();
    return 0;
}
