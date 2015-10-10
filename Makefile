INC_DIR = inc
SRC_DIR = src
OBJ_DIR = obj
TST_DIR = test
DST_DIR = dist

CC      = g++
CCFLAGS  = -I${INC_DIR}
LDFLAGS =

TARGET  = quad_trees
TEST    = test_quad_trees

.PHONY: clean cleantest

all: cleantest ${TARGET}.o ${TEST}.o ${TEST}


${TEST}: ${OBJ_DIR}/${TEST}.o ${OBJ_DIR}/${TARGET}.o
	$(CC) -o $@ $^ $(LDFLAGS)

${TARGET}.o: ${SRC_DIR}/${TARGET}.cpp ${INC_DIR}/${TARGET}.h
	$(CC) -c $(CCFLAGS) $<
	mv *.o ./${OBJ_DIR}

${TEST}.o: ${TST_DIR}/${TEST}.cpp ${OBJ_DIR}/${TARGET}.o
	$(CC) -c $(CCFLAGS) $<
	mv *.o ./${OBJ_DIR}

clean:
	rm -f ${OBJ_DIR}/*.o
	rm -f ${DST_DIR}/*

cleantest: clean
	rm -f ${TEST}
