all: RegexTest.class

RegexTest.class: RegexTest.java
	javac -cp .:/usr/share/java/junit.jar RegexTest.java

clean:
	rm -f RegexTest.class

run: RegexTest.class
	java -cp .:/usr/share/java/junit.jar org.junit.runner.JUnitCore RegexTest
