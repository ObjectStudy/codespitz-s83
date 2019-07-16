package week2.report1;

import java.time.DayOfWeek;
import java.time.LocalTime;

public class PeriodPercentDiscount extends PercentDiscount {
  private final DayOfWeek dayOfWeek;
  private final LocalTime startTime;
  private final LocalTime endTime;

  public PeriodPercentDiscount(double pecent, DayOfWeek dayOfWeek, LocalTime startTime, LocalTime endTime) {
    super(pecent);
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
