import Foundation


class TicketSeller {
    var ticketOffice: TicketOffice? = nil

    // 생성자, Setter 에서 받을건지는 신중하게 선택해야 한다.
    func setTicketOffice(ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }

    // Audience 가 표를 원할때 TicketSeller 가 표를 발급한다.
    // TicketSeller 갑 / Audience 을
    func getTicket(audience: Audience) -> Ticket {
        var ticket = Ticket.empty
        if audience.getInvitation().isEmpty() {
            ticket = self.ticketOffice?.getTicketWithNoFee() ?? Ticket.empty
            if ticket.isEmpty() {
                // TicketSeller <> Audience Transaction 이 발생하는 순간
                audience.remoteInvitation()
            }
        } else {
            let price = ticketOffice?.getTicketPrice() ?? 0
            if price > 0 && audience.hasAmount(amount: price) {
                ticket = ticketOffice?.getTicketWithFee() ?? Ticket.empty
                if ticket.isEmpty() {
                    // TicketSeller <> Audience Transaction 이 발생하는 순간
                    audience.minusAmount(amount: price)
                }
            }
        }
        return ticket
    }
}
