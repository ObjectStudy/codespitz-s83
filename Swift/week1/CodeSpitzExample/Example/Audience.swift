import Foundation


class Audience {
    private var ticket = Ticket.empty
    private var invitation = Invitation.empty
    private var amount: Long = 0

    init(amount: Long) {
        self.amount = amount
    }

    func buyTicket(seller: TicketSeller) {
        // TicketSeller 가 있어야만 Ticket을 구매할 수 있다.
        self.ticket = seller.getTicket(audience: self)
    }

    func getTicket() -> Ticket {
        return self.ticket
    }

    func setInvitation(invitation: Invitation) {
        self.invitation = invitation
    }
}


// TicketSeller 와 Transaction 하기 위해서는 아래 Method 들이 오픈되어야 한다.
// TransactionCondition 라는 protocol 로 책임을 분리할 수 있다.
/*
protocol TransactionCondition {
    func hasAmount(amount: Long) -> Bool
    func minusAmount(amount: Long) -> Bool
    func getInvitation() -> Invitation
    func remoteInvitation()
}
 */
extension Audience {

    func hasAmount(amount: Long) -> Bool {
        return self.amount >= amount
    }

    @discardableResult
    func minusAmount(amount: Long) -> Bool {
        if amount > self.amount { return false }
        self.amount -= amount
        return true
    }
    func getInvitation() -> Invitation {
        return invitation
    }
    func remoteInvitation() {
        self.invitation = Invitation.empty
    }
}
