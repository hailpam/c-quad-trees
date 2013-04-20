#ifndef QUAD_TREES_H
#define QUAD_TREES_H

// define the value type
typedef int V;

struct QuadPointers;

// define the quad node
struct QuadNode {
    QuadPointers* pts;   /* child pointers */
    QuadNode* par;      /* parent pointer */
    int x;              /* x coordinate */
    int y;              /* y coordinate */
    V v;                 /* node value */
};

// define the quad tree pointers
struct QuadPointers {
    QuadNode* nWest;    /* north west child pointer */
    QuadNode* nEast;    /* north east child pointer */
    QuadNode* sWest;    /* south west child pointer */
    QuadNode* sEast;    /* south east child pointer */
};

class QuadTree {
    private:
        QuadNode* root;

    public:
        QuadTree();
        ~QuadTree();
        /**
         *
         */
        void add(int x, int y, V v);
        /**
         *
         */
        V find(int x, int y);
        /**
         *
         */
        V remove(int x, int y);
        /**
         * Return the size
         */
        int size();
        /**
         *
         */
        void update(int x, int y, V v);
};

#endif
