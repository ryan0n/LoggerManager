import Foundation

class LoggerManager {
    // MARK:- Properties
    private var logLevel: LogLevel
    
    // MARK:- Initializer
    init(withLogLevel: LogLevel = .debug ) {
        logLevel = withLogLevel
    }
    
    // MARK:- Private methods
    private func log(_ message: LogMessage) {
        if message.level.rawValue >= logLevel.rawValue  {
            print("\(message.stringValue)")
        }
    }
    
    // MARK:- Public methods
    public func debug(_ message: String = "", context: LogContext = LogContext()) {
        log(LogMessage(level: .debug, message: message, context: context))
    }

    public func info(_ message: String = "", context: LogContext = LogContext()) {
        log(LogMessage(level: .info, message: message, context: context))
    }
    
    public func warning(_ message: String = "", context: LogContext = LogContext()) {
        log(LogMessage(level: .warning, message: message, context: context))
    }

    public func error(_ message: String = "", context: LogContext = LogContext()) {
        log(LogMessage(level: .error, message: message, context: context))
    }
}

enum LogLevel: Int {
    case error   = 3
    case warning = 2
    case info    = 1
    case debug   = 0
}

struct LogMessage {
    let created: Date = Date()
    let level: LogLevel
    let message: String
    let context: LogContext
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
            return "\(level)" +
                " : \(dateString)" +
                " : \(URL(fileURLWithPath: context.file).lastPathComponent)" +
                " : \(context.line)" +
                " : \(context.function)" +
                " : \(message)"
        }
    }
}

struct LogContext {
    public var file: String
    public var line: Int
    public var function: String
    
    init(file: String = #file, line: Int = #line, function: String = #function) {
        self.file = file
        self.line = line
        self.function = function
    }
}
