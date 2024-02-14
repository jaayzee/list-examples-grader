CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -f student-submission/ListExamples.java ]
then
    cp student-submission/*.java grading-area
    cp TestListExamples.java grading-area
    cp -r lib grading-area
    echo "File found"
else

    echo "Missing ListExamples.java in student submission"
    echo "Score: 0"
    exit
fi

cd grading-area

javac -cp $CPATH *.java > compile.txt
if [ $? -ne 0 ]
then
    echo "Compilation Error"
    echo "Score: 0"
    exit
else 
    echo "Compilation Successful"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > junit-output.txt
lastline=$(cat junit-output.txt | tail -n 2 | head -n 1)
check=$(echo $lastline | cut -c1-2)
if [[ "$check" = "OK" ]]
then
    tests=$(echo $lastline | awk -F'[() ]' '{print $3}')
    successes=$tests
else
    tests=$(echo $lastline | awk -F'[, ]' '{print $3}')
    failures=$(echo $lastline | awk -F'[, ]' '{print $6}')
    successes=$((tests - failures))
fi

echo "Your score is $successes / $tests"


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
