all: minDist

minDist: minimumDistance.o
	g++ minimumDistance.o -o minDist

minimumDistance.o: minimumDistance.cpp
	g++ -c minimumDistance.cpp

clean:
	rm *.o minDist
