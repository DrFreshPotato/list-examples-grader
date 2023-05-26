CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"
echo $CPATH
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission

#Checking correct file submitted
if [[ -f "student-submission/ListExamples.java" ]]
then 
    cp student-submission/ListExamples.java grading-area
    cp TestListExamples.java grading-area
    cp -r lib grading-area
else 
    echo "ListExamples.java file not found"
    exit
fi
cd grading-area
javac ListExamples.java
javac -cp $CPATH TestListExamples.java
#Not using $CPATH because command is different on windows than mac/linux
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > results.txt

grep -e "tests" -e "Failure" results.txt
#cat results.txt

echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
