import Foundation

struct Ticket {
    private var isEntered: Bool = false
    
    private let theater: Theater?
    
    init(theater: Theater?) {
        self.theater = theater
    }
}

extension Ticket {
    static let empty = Ticket(theater: nil)
    
    mutating func isValid(theater: Theater?) -> Bool {
        if isEntered, theater !== self.theater, self.isEmpty() {
            return false
        } else {
            self.isEntered = true
            return true
        }
    }
    
    var fee: Long {
        return self.theater?.getFee() ?? 0
    }
    
    func isEmpty() -> Bool {
        return self.theater == nil
    }
}
