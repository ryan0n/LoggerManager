# LoggerManager
A simple Swift logger to provide timestamp, filename, line number, and function context when logging.

Example:

```
import Foundation

class myClass {
    private let loggerManager = LoggerManager()
    
    init() {
        exampleMethod()
    }
    
    func exampleMethod() {
        loggerManager.info("example info message")
        loggerManager.error("example error message")
        loggerManager.warning("example warning message")        
        loggerManager.info("example info message")
    }
}
````

Log output:

```
info    : 2018-03-25 12:29:40.7290 : myClass.swift : 11 : someMethod() : example info message
error   : 2018-03-25 12:29:40.7291 : myClass.swift : 12 : someMethod() : example error message
warning : 2018-03-25 12:29:40.7292 : myClass.swift : 13 : someMethod() : example warning message
info    : 2018-03-25 12:29:40.7293 : myClass.swift : 14 : someMethod() : example info message
```
