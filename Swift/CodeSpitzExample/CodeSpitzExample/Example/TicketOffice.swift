import Foundation

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
    
    // TicketOffice 는 Invitation 에 대해 모른다.
    // VIP, 연간회원등 추가될 정책을 모두 수용할려면 Invitation 에 구체적인 정보를 몰라야 한다.
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
