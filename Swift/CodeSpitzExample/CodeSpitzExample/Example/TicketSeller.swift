import Foundation


class TicketSeller {
    var ticketOffice: TicketOffice? = nil

    func setTicketOffice(ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
}

extension TicketSeller {

    func getTicket(audience: Audience) -> Ticket {
        var ticket = Ticket.empty
        if audience.getInvitation().isEmpty() {
            ticket = self.ticketOffice?.getTicketWithNoFee() ?? Ticket.empty
            
            
            if ticket.isEmpty() {
                audience.remoteInvitation()
            }
        } else {
            let price = ticketOffice?.getTicketPrice() ?? 0
            if price > 0 && audience.hasAmount(amount: price) {
                ticket = ticketOffice?.getTicketWithFee() ?? Ticket.empty
                if ticket.isEmpty() {
                    audience.remoteInvitation()
                }
            }
        }
        return ticket
    }
}
