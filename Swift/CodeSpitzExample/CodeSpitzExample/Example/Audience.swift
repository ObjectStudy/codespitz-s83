import Foundation


class Audience {
    private var ticket = Ticket.empty
    private var invitation = Invitation.empty
    private var amount: Long = 0

    init(amount: Long) {
        self.amount = amount
    }

    func buyTicket(seller: TicketSeller) {
        self.ticket = seller.getTicket(audience: self)
    }
}

extension Audience {

    func hasAmount(amount: Long) -> Bool {
        return self.amount >= amount
    }

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
    
    func getTicket() -> Ticket {
        return self.ticket
    }
    
    func setInvitation(invitation: Invitation) {
        self.invitation = invitation
    }
}
