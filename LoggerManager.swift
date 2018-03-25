import Foundation

class LoggerManager {
    // MARK:- Properties
    private var outputEnabled = true
    
    // MARK:- Private methods
    private func handleLogEntry(_ withLogEntry: LogEntry) {
        if outputEnabled {
            print("\(withLogEntry.stringValue)\n")
        }
    }
    
    // MARK:- Public methods
    public func info(_ message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        handleLogEntry(
            LogEntry(
                created:  Date(),
                type:     .info,
                message:  message,
                file:     file,
                line:     line,
                function: function
            )
        )
    }
    
    public func error(_ message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        handleLogEntry(
            LogEntry(
                created:  Date(),
                type:     .error,
                message:  message,
                file:     file,
                line:     line,
                function: function
            )
        )
    }
}

struct LogEntry {
    let created: Date
    let type: LogType
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
            return "\(type)" +
                " : \(dateString)" +
                " : \(fileUrl.lastPathComponent):\(line):\(function)" +
                " : \(message)"
        }
    }
}

enum LogType {
    case info
    case warning
    case error
}

