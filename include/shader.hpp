#pragma once

#include <string>

#include <glm/glm.hpp>

class Shader {
public:
    Shader(const std::string& vertexPath, const std::string& fragmentPath);
    ~Shader();
    void use() const;
    unsigned int getID() const;

private:
    unsigned int ID;
    std::string loadShaderSource(const std::string& filePath);
    unsigned int compileShader(unsigned int type, const std::string& source);
};
