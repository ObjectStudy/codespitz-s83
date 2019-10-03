import Foundation

enum TicketError: Error {
    case noTickets
}

class TicketOffice {
    private var amount: Long
    private var tickets = [Ticket]()
            
    init(amount: Long) {
        self.amount = amount
    }
    
    func addTicket(ticket: Ticket) {
        self.tickets.append(ticket)
    }
    
    func getTicketWithFee() -> Ticket {
        if tickets.isEmpty {
            return Ticket.empty
        } else {
            let ticket = tickets.remove(at: 0)
            amount += ticket.fee
            return ticket
        }
    }
    
    func getTicketWithNoFee() -> Ticket {
        if tickets.isEmpty {
            return Ticket.empty
        } else {
            return tickets.remove(at: 0)
        }
    }
    
    func getTicketPrice() -> Long {
        if tickets.isEmpty {
            return 0
        } else {
            return tickets[0].fee
        }
    }
}
