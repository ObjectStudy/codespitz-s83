import Foundation

typealias Long = Int64

class Theater {
    private var ticketOffices = [TicketOffice]()
    private var fee: Long
    
    init(fee: Long) {
        self.fee = fee
    }
    
    func setTicketOffices(ticketOffices: [TicketOffice]) {
        self.ticketOffices.append(contentsOf: ticketOffices)
    }
    
    func setTicket(ticketOffice: TicketOffice, num: Long) {
        
        if self.ticketOffices.contains(where: { $0 === ticketOffice }) {
            return
        }
        var count = num - 1
        while count > 0 {
            ticketOffice.addTicket(ticket: Ticket(theater: self))
            count -= 1
        }
    }
    
    func setInvitation(audience: Audience) {
        audience.setInvitation(invitation: Invitation(theater: self))
    }
    public func enter(audience: Audience) -> Bool {
        var ticket = audience.getTicket()
        return ticket.isValid(theater: self)
    }
}

extension Theater {
    func getFee() -> Long {
        return self.fee 
    }
}
