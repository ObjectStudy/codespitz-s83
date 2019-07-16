package week2.report1;

import java.time.DayOfWeek;
import java.time.LocalTime;

public class PeriodAmountDiscount extends AmountDiscount {
  private final DayOfWeek dayOfWeek;
  private final LocalTime startTime;
  private final LocalTime endTime;

  public PeriodAmountDiscount(Money amount, DayOfWeek dayOfWeek, LocalTime startTime, LocalTime endTime ) {
    super(amount);
    this.dayOfWeek = dayOfWeek;
    this.startTime = startTime;
    this.endTime = endTime;
  }

  @Override
  public boolean isSatisfiedBy(Screening screening, int audienceCount) {
    return dayOfWeek.equals(screening.whenScreened.getDayOfWeek())
    	&& startTime.compareTo(screening.whenScreened.toLocalTime()) <= 0
    	&& endTime.compareTo(screening.whenScreened.toLocalTime()) > 0 ;
  }
}
