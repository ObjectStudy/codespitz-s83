import Foundation

typealias Long = Int64

class Theater {
    private var ticketOffices = [TicketOffice]()
    private let fee: Long
    
    // Threater 는 fee 를 알고 있는 유일한 클래스
    init(fee: Long) {
        self.fee = fee
    }
    
    func getFee() -> Long {
        return self.fee
    }
    // 인터파크, 지마켓.. 등 여러 TicketOffice 가 존재할 수 있다.
    func setTicketOffices(ticketOffices: [TicketOffice]) {
        self.ticketOffices.append(contentsOf: ticketOffices)
    }
    
    // Theater -> TicketOffice 에게 원하는 수량의 Ticket을 발급한다.
    func setTicket(ticketOffice: TicketOffice, num: Long) {
        // Theater 가 거래하고 있는 TicketOffice 가 아니라면 발급하지 않는다.
        if self.ticketOffices.contains(where: { $0 === ticketOffice }) {
            return
        }
        var count = num - 1
        while count > 0 {
            // 현재 Theater 가 발급한 표를 TicketOffice 에게 발급한다.
            ticketOffice.addTicket(ticket: Ticket(theater: self))
            count -= 1
        }
    }
    
    //
    func setInvitation(audience: Audience) {
        // 현재 Theater 에서 audience 에게 Invitation 을 발급한다.
        audience.setInvitation(invitation: Invitation(theater: self))
    }
    
    public func enter(audience: Audience) -> Bool {
        var ticket = audience.getTicket()
        // Audience 의 Ticket 이 정상인지 아닌지 검사한다.
        return ticket.isValid(theater: self)
    }
    

}
