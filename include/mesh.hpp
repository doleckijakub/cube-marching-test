#pragma once

#include "vertex.hpp"

#include <vector>

class Mesh {
public:
    Mesh(const std::vector<Vertex>& vertices);
    ~Mesh();
    void draw() const;

private:
    unsigned int VAO, VBO;
};
