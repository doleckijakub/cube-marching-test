CC = gcc
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -Iinclude -Iexternal/glad/include
LDFLAGS = -lglfw -ldl -lGL -lX11 -lpthread
SRC = src
BUILD = build
EXEC = exe

SOURCES = $(wildcard $(SRC)/*.cpp)
OBJS = $(patsubst $(SRC)/%.cpp,$(BUILD)/%.o,$(SOURCES)) $(BUILD)/glad.o

.PHONY: all clean

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(BUILD):
	mkdir -p $@

$(BUILD)/glad.o: external/glad/src/glad.c | $(BUILD)
	$(CC) -o $@ -c $< -Iexternal/glad/include

$(BUILD)/%.o: $(SRC)/%.cpp | $(BUILD)
	$(CXX) -o $@ -c $(CXXFLAGS) $<

clean:
	rm -rf $(BUILD) $(EXEC)