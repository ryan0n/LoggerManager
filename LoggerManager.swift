import Foundation

class LoggerManager {
    // MARK:- Properties
    private var logLevel: LogLevel
    
    init(withLogLevel: LogLevel = .debug ) {
        logLevel = withLogLevel
    }
    
    // MARK:- Private methods
    private func log(_ message: LogMessage) {
        if message.level.rawValue >= logLevel.rawValue  {
            print("\(message.stringValue)\n")
        }
    }
    
    // MARK:- Public methods
    public func debug(_ message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        log(LogMessage(created:  Date(), level: .debug, message: message, file: file, line: line, function: function))
    }

    public func info(_ message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        log(LogMessage(created:  Date(), level: .info, message: message, file: file, line: line, function: function))
    }
    
    public func warning(_ message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        log(LogMessage(created:  Date(), level: .warning, message: message, file: file, line: line, function: function))
    }

    public func error(_ message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        log(LogMessage(created:  Date(), level: .error, message: message, file: file, line: line, function: function))
    }
}

struct LogMessage {
    let created: Date
    let level: LogLevel
    let message: String
    let file: String
    let line: Int
    let function: String
    var dateString: String {
        get {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
            return formatter.string(from: created)
        }
    }
    var stringValue: String {
        get {
            let fileUrl = URL(fileURLWithPath: file)
            return "\(level)" +
                " : \(dateString)" +
                " : \(fileUrl.lastPathComponent):\(line):\(function)" +
                " : \(message)"
        }
    }
}

enum LogLevel: Int {
    case error   = 3
    case warning = 2
    case info    = 1
    case debug   = 0
}




