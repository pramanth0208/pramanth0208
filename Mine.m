prims

package prashanth;
import java.util.*;
public class Prims {
public static void main(String[] args) {
int n, i, j, min = 0, a = 0, u = 0, b = 0, v = 0, source;
int ne = 1;
int min_cost = 0;
int cost[][] = new int[20][20];
int visited[] = new int[20];
Scanner in = new Scanner(System.in);
System.out.println("Enter the no. of nodes:");
n = in.nextInt();
System.out.println("Enter the cost matrix:");
for (i = 1; i <= n; i++)
for (j = 1; j <= n; j++)
cost[i][j] = in.nextInt();
for (i = 1; i <= n; i++)
visited[i] = 0;
System.out.println("Enter the root node:");
source = in.nextInt();
visited[source] = 1;
System.out.println("Minimum cost spanning tree is:");
while (ne < n) {
min = 999;
for (i = 1; i <= n; i++) {
for (j = 1; j <= n; j++) {
if (cost[i][j] < min)
if (visited[i] == 0)
continue;
else {
min = cost[i][j];
a = u = i;
b = v = j;
}
}
}
if (visited[u] == 0 || visited[v] == 0) {
ne++;
System.out.println("Edge " + ne + "\t" + a + "-->" + b + "=" + min);
min_cost = min_cost + min;
visited[b] = 1;
}
cost[a][b] = cost[b][a] = 999;
}
System.out.println("Minimum cost = " + min_cost);
}
}

//KRUSKAL

package prashanth;

import java.util.Scanner;

public class Kruskal {

public static int find(int v, int s[]) {

while (s[v] != v)

v = s[v];

return v;

}

public static void union1(int i, int j, int s[]) {

s[i] = j;

}

public static void kruskal(int n, int c[][]) {

int count = 0, i, min = 0, j, u = 0, v = 0, k = 0, sum = 0;

int s[] = new int[10];

int t[][] = new int[10][2];

for (i = 0; i < n; i++)

s[i] = i;

while (count < n - 1) {

min = 999;

for (i = 0; i < n; i++) {

for (j = 0; j < n; j++) {

if (c[i][j] != 0 && c[i][j] < min) {

min = c[i][j];

u = i;

v = j;

}

}

}

if (min == 999)

break;

i = find(u, s);

j = find(v, s);

if (i != j) {

t[k][0] = u;

t[k][1] = v;

k++;

count++;

sum += min;

union1(i, j, s);

}

c[u][v] = c[v][u] = 999;

}

if (count == n - 1) {

System.out.println("Cost of Spanning tree: " + sum);

System.out.println("Spanning tree is:");

for (k = 0; k < n - 1; k++)

System.out.println(t[k][0] + "," + t[k][1]);
} else

System.out.println("Spanning tree dosent exist");

}

public static void main(String[] args) {

int n, i, j;

int c[][] = new int[10][10];

Scanner in = new Scanner(System.in);

System.out.println("Enter the no. of nodes:");

n = in.nextInt();

System.out.println("Enter the cost Adjacency matrix:");

for (i = 0; i < n; i++)

for (j = 0; j < n; j++)

c[i][j] = in.nextInt();

kruskal(n, c);

}

}


//Dijkstra Algorithm -- SSSP Problem

package prashanth;

import java.util.Scanner;

public class Sssp {

static int[][] cost;

static int dist[], n;

static int min(int m, int n) {

return ((m < n) ? m : n);

}

static void Dijkstra(int source) {

int[] s = new int[n];

int min, w = 0;

System.arraycopy(cost[source], 0, dist, 0, n);

// Initialize dist from source to source as 0

// mark source vertex - estimated for its shortest path

s[source] = 1;

dist[source] = 0;

for (int i = 0; i < n - 1; i++) {

// Find the nearest neighbour vertex

min = 999;

for (int j = 0; j < n; j++)

if ((s[j] == 0) && (min > dist[j])) {

min = dist[j];

w = j;

}

s[w] = 1;

// Update the shortest path of neighbour of w

for (int v = 0; v < n; v++)

if (s[v] == 0 && cost[w][v] != 999) {

dist[v] = min(dist[v], dist[w] + cost[w][v]);

}

}

}

public static void main(String[] args) {

int source;

Scanner s = new Scanner(System.in);

System.out.println("Enter the no.of vertices");

n = s.nextInt();

cost = new int[n][n];

dist = new int[n];

// Enter the cost matrix, 999 for no direct edge from i to j

System.out.println("Enter the cost matrix");

for (int i = 0; i < n; i++)

for (int j = 0; j < n; j++)

cost[i][j] = s.nextInt();

System.out.println("Enter the source vertex");

source = s.nextInt();

Dijkstra(source);
System.out.println(" the shortest distance is..."); for (int i = 0; i < n; i++) System.out.println("Cost from " + source + " to " + i + " is " + dist[i]); s.close(); } 
