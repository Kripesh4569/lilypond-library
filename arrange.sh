#!/bin/sh
WORKDIRECTORY=/Users/godey/Documents/lilypond
types=(compositions transcriptions rhythms)
for i in "${types[@]}"
do
    mv ${WORKDIRECTORY}/${i}/src/*.pdf  ${WORKDIRECTORY}/${i}/pdf/
    mv ${WORKDIRECTORY}/${i}/src/*.midi ${WORKDIRECTORY}/${i}/midi/
done