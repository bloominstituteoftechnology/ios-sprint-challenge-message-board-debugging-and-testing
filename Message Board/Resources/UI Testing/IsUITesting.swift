
import Foundation

var isUITesting: Bool {
    return CommandLine.arguments.contains("UITesting")
}
