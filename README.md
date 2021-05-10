# Vividus Starter

The purpose of this repository is to help users start creating automated tests using Vividus.

- [Prerequisites](#prerequisites)
  * [Install and configure Git](#install-and-configure-git)
  * [Install Java](#install-java)
- [How to run the existing tests](#how-to-run-the-existing-tests)
- [How to view the test results](#how-to-view-the-test-results)
- [How to create own test project using starter](#how-to-create-own-test-project-using-starter)
- [How to use IDE for the tests development](#how-to-use-ide-for-the-tests-development)
  * [Eclipse](#eclipse)
    + [Prerequisites](#prerequisites-1)
    + [Import the project](#import-the-project)
- [Support](#support)

## Prerequisites
### Install and configure Git
1. Download and install [Git client](http://git-scm.com/downloads)
1. [Configure](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_your_identity) your identity

### Install Java
1. The baseline is JDK 11. The latest [JDK 16](https://jdk.java.net/16/) is supported as well
1. Configure `JAVA_HOME` environment variable
1. Update `PATH` environment variable: 
    * Windows: add `%JAVA_HOME%/bin`
    * macOS / Linux: add `$JAVA_HOME/bin`

## How to run the existing tests
1. Clone the repository:
    ```shell
    git clone --recursive https://github.com/vividus-framework/vividus-starter.git
    ```
1. Set the VIVIDUS_BUILD_SYSTEM_HOME environment variable
    ```shell
    export VIVIDUS_BUILD_SYSTEM_HOME=/dir/where-you-cloned/vividus-starter/vividus-build-system
    ```
1. Go to the local directory with your cloned repository: 
    ```shell
    cd vividus-starter
    ```
1. Run your tests: 
    ```shell
    ./gradlew runStories
    ```
## How to view the test results
1. At the end of any test run, vividus will give you a link to where the corresponding test result was published. It should look like this:
    ```shell
    2020-11-18 16:22:17,650 [main] INFO  org.vividus.bdd.report.allure.AllureReportGenerator - Allure report is successfully generated at: /dir/to/where/the/results-are-published/.out/vividus-demo/reports/allure
    ```
1. cd into the directory.
    ```shell
    cd /dir/to/where/the/results-are-published/.out/vividus-demo/reports/allure
    ```
1. Start a webserver of your choice, in the example below we are using a node webserver through port 3456
    ```shell
    ✔ ~/dir/to/where/the/results-are-published/.out/vividus-demo/reports/allure
    $ http-server -p 3456
    ```
1. launch a browser, type localhost:3456 into the URL. If you followed the instructions perperly, you should see your report.

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
1. Install [Eclipse IDE 2021-03](https://www.eclipse.org/downloads/packages/release/2021-03/r/eclipse-ide-java-developers)
1. Add [JBehave plugin](https://jbehave.org/eclipse-integration.html)
#### Import the project
1. Go to the root directory of the test project
1. Generates all Eclipse configuration files: 
    ```shell
    ./gradlew eclipse
    ```
1. [Import the project to Eclipse](https://help.eclipse.org/2021-03/index.jsp?topic=%2Forg.eclipse.platform.doc.user%2Ftasks%2Ftasks-importproject.htm)


## Support
[**Slack**](https://vividus-support.herokuapp.com/)
