# Vividus Starter

The purpose of this repository is to help users start creating automated tests using Vividus.

## Prerequisites
### Install Java
1. The baseline is JDK 11. Latest [JDK 15](https://jdk.java.net/15/) is supported as well
1. Configure `JAVA_HOME` environment variable
1. Update `PATH` environment variable: add `$JAVA_HOME/bin`

## How to run the existing tests
1. Clone the repository:
    ```shell
    git clone --recursive https://github.com/vividus-framework/vividus-starter.git
    ```
1. Go to the local directory with your cloned repository: 
    ```shell
    cd vividus-starter
    ```
1. Run your tests: 
    ```shell
    ./gradlew runStories
    ```

## How to create own test project using starter
1. Login to Github: http://github.com. (Create a new account before if you don't have any)
1. Generate your own project based on the starter project:
    - Open [generator](https://github.com/vividus-framework/vividus-starter/generate)
    - Provide repository name for your test project
    - Choose option to make your repository `Public` or `Private` (`Private` is recommended from start, it can be changed in future)
1. Clone your newly generated repository:
    ```shell
    git clone --recursive your_generated_project_link.git
    ```
1. Go to the local directory with your cloned repository: 
    ```shell
    cd your_repository_name
    ```

## How to use IDE for the tests development
### Eclipse
#### Prerequisites
1. Install [Eclipse IDE 2020-09](https://www.eclipse.org/downloads/packages/release/2020-09/r/eclipse-ide-java-developers)
1. Add [JBehave plugin](https://jbehave.org/eclipse-integration.html)
#### Import the project
1. Go to the root directory of the test project
1. Generates all Eclipse configuration files: 
    ```shell
    ./gradlew eclipse
    ```
1. [Import the project to Eclipse](https://help.eclipse.org/2020-09/index.jsp?topic=%2Forg.eclipse.platform.doc.user%2Ftasks%2Ftasks-importproject.htm)


## Support
[**Slack**](https://vividus-support.herokuapp.com/)
