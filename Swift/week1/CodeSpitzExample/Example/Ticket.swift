import Foundation

struct Ticket {

    // Maintenance of State 에서 정보 은닉을 수행한다.
    private var isEntered: Bool = false

    private let theater: Theater?

    init(theater: Theater?) {
        self.theater = theater
    }
}

extension Ticket {
    static let empty = Ticket(theater: nil)

    mutating func isValid(theater: Theater?) -> Bool {
        if isEntered,
            theater !== self.theater,
            self.isEmpty() // 객체를 식별자로 식별하고 있다
            {
            return false
        } else {
            self.isEntered = true
            return true
        }
    }

    // Pointer (Ticket) -> Pointer (Theater) -> Pointer (Theater.fee) 로 fee 를 가져온다.
    // 값의 변화를 반영할려면 Pointer > Pointer 로 가져와야 한다.
    var fee: Long {
        return self.theater?.getFee() ?? 0
    }

    func isEmpty() -> Bool {
        return self.theater == nil
    }
}
