all: testCircle testMatrix ansCircle ansMatrix

testCircle: testOfCircleGraph.cpp
	g++ testOfCircleGraph.cpp -o testCircle

testMatrix: testOfMatrixGraph.cpp
	g++ testOfMatrixGraph.cpp -o testMatrix

ansCircle: answerOfCircleGraph.cpp
	g++ answerOfCircleGraph.cpp -o ansCircle

ansMatrix: answerOfMatrixGraph.cpp
	g++ answerOfMatrixGraph.cpp -o ansMatrix

clean:
	rm testCircle testMatrix ansCircle ansMatrix
