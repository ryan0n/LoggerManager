# LoggerManager
A simple Swift logger to provide timestamp, filename, line number, and function context when logging.

Example usage:

func someMethod() {
    loggerManager.info("begin")
    loggerManager.error("some error message")
    loggerManager.info("end")
}

info  : 2018-03-25 12:29:40.7290 : ViewModel.swift:56:someMethod() : begin
error : 2018-03-25 12:29:40.7290 : ViewModel.swift:57:someMethod() : some error message
info  : 2018-03-25 12:29:40.7300 : ViewModel.swift:58:someMethod() : end
