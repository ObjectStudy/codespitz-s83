import Foundation

struct Invitation {
    private let theater: Theater?

    init(theater: Theater?) {
        self.theater = theater
    }
}

extension Invitation {
    static let empty = Invitation(theater: nil)
    
    func isEmpty() -> Bool {
        return self.theater == nil
    }
}
