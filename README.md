# LoggerManager
A simple Swift logger to provide timestamp, filename, line number, and function context when logging.

Example:

```
class myClass {
    private let loggerManager = LoggerManager()
    
    init() {
        exampleMethod()
    }
    
    func exampleMethod() {
        loggerManager.info("example info message")
        loggerManager.error("example error message")
        loggerManager.info("example info message")
    }
}
````

Log output:

```
info  : 2018-03-25 12:29:40.7290 : ViewModel.swift:56:someMethod() : example info message
error : 2018-03-25 12:29:40.7291 : ViewModel.swift:57:someMethod() : example error message
info  : 2018-03-25 12:29:40.7292 : ViewModel.swift:58:someMethod() : example info message
```
