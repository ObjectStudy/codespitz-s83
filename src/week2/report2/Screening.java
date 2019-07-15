package week2.report2;

import java.time.LocalDateTime;

public class Screening {
  
  final int sequence;
  final LocalDateTime whenScreened;
    
  public Screening(int sequence, LocalDateTime when) {
    this.sequence = sequence;
    this.whenScreened = when;
    
  }
  
  
  /*boolean hasSeat(int count) {
    return seat >= count;
  }

  void reserveSeat(int count) {
    if (hasSeat(count))
      seat -= count;
    else
      throw new RuntimeException("no seat");
  }*/
}
