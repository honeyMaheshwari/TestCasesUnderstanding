# TestCasesUnderstanding #

### What is a Unit Test? ###
- A Unit Test is a small function that you write to test some part of your code.
- Unit tests are small pieces of code that perform one specific task.


### Testing Pyramid ###
```
| ----------------- | --------------------------------------------------------------------------|
| UI Tests          | Automated tests to test User Interface Interaction and Behaviour.         |
| ----------------- | --------------------------------------------------------------------------|
| Integration Tests | App code is tested without facking database or HTTP Connections.          |
| ----------------- | --------------------------------------------------------------------------|
| Unit Tests        | Testing isolated small pieces of code with Fake or Mock dependencies.     |
| ----------------- | --------------------------------------------------------------------------|
```

### F.I.R.S.T. Principle ###
1. Fast: Unit tests run fast. 
2. Independent: Unit tests must be independent from each other. One unit test should not depend on the result produced by another unit test.
3. Repeatable: The unit test should be repeatable, if run multiple times, it should produce the same result.
4. Self-Validating: The unit test will validate the result that the function under test has produced and it will itself make the decision wether it passed or fails. The developer should not do any manual checks after the test is completed. 
5. Thorough & Timely: While testing a function we should consider a happy path as well as a negative scenario. Most of the time we create multiple unit tests. Unit tests should also be timely. It is better to create unit tests at the time you are working on the app feature. This way you will have more confidence that the feature does work as expected and less chances that you will introduce a bug that will be released to production.
     

### Test-Driven Development (TDD) ###
- Test Driven Development is the way of structuring your development process.
- We first write a unit test and then we write code to make that unit test pass.
- When following the TDD approach, we follow 4 important steps that define the test-driven development life cycle. [Red -> Green -> Refactor -> Repeat]
    - Red: Write a unit test that fails, the next step will be to write up code to make this unit test pass.
    - Green: Write App code to make the unit test pass.
    - Refactor: Clean up and improve Unit Test and App Code. At this step, we need to review our unit test code and the app code and anything that we see can be improved needs to be improved at this step.
    - Repeat: Repeat these steps until all your App features are built and tested.
- First, we write a new unit test that will initially fail. Second, we will write up code to make this unit test pass and the third step is to refactor the unit test and the app code to make it look and work well.


### Xcode Unit Test Case Class: ###
When you create the unit test case class, it will already have some methods in it added by Xcode:  
- `func setUpWithError()`: This method is called before the invocation of each test method in the class.
- `func setUp()`: This method is called before the invocation of each test method in a test case class. If your test case class has 3 different methods, the setup method will be called once before each unit test method is invoked. You can use this setup method to put any code that needs to be called before each test method.
- `func tearDownWithError()`: This method is called after the invocation of each test method in the class.
- `func tearDown()`: This method is called after the invocation of each test method in a test case class. It provides an opportunity to perform cleanup after each test method completes.
- `class func setUp()`: Same as `setUp()` method but class level methods will be executed one time only per each class.
- `class func tearDown()`: Same as `tearDown()` method but class level methods will be executed one time only per each class.
- `addTeardownBlock`: We can also use `addTeardownBlock` to release the created resources. It is called one time only after the test method that defines it is run and it is called before the `tearDownWithError()` method is called.
- `func testExample()`: This method is usually an example of a test method.
- `func testPerformanceExample()`: You have an example of a performance test, which is also empty and doesn't do anything to get some value out of it. You will need to update it with additional code.


### Order in which Test methods execute ###
```
|-- Instance on Test Case Class
|   |
|   |
|   |-- `class setUp()`
|   |   |
|   |   |
|   |   |-- Testing Method 1
|   |   |   |
|   |   |   |-- `setUpWithError()`
|   |   |   |-- `setUp()`
|   |   |   |-- `testMethod1()`
|   |   |   |-- `addTeardownBlock` // if implemented 
|   |   |   |-- `tearDown()`       
|   |   |   |-- `tearDownWithError()`   
|   |   |
|   |   |
|   |   |-- Testing Method 2
|   |   |   |
|   |   |   |-- `setUp()`
|   |   |   |-- `testMethod2()`
|   |   |   |-- `tearDown()` 
|   |   |
|   |   |
|   |-- `class tearDown()`
|   |
|   |
|-- Deinit
 
```


### Unit Test Method Requirements ###
- Each test method must begin with the prefix **test**.
- Test method does not take arguments.
- Test method does not return a value.


### Common Unit Test Naming ###
```
func test<System Under Test>_<Condition or State Change>_<Expected Result>() {

}
```
- System Under Test: System under test name is a name of whatever you are testing. (like: SignUpViewModel)
- Underscore(\_): It is not required, it is just being used to visually separate one part from another.
- Condition or State Change
- Expected Result


### AAA/GWT Pattern ###
Defines how code in a unit test method is structured. Understanding this pattern makes writing and understanding unit test code written by other developers easier. The code in your unit test
method is arranged in 3 major blocks:
- Arrange/Given: Prepare all the needed variables and objects that are needed for your system under test to work and to return the expected result.
- Act/When: Here you will actually invoke the method that you are testing and it will return a result value that needs to be validated.
- Assert/Then: This is where the result produced by the system under the test is validated to make a decision whether this test is passing or failing.


### Refrence ###
- [Unit Testing Swift Mobile App](https://www.udemy.com/course/unit-testing-ios-mobile-app/?couponCode=ST18MT62524)

