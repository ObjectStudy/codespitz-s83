package week2.report1;

import java.time.LocalDateTime;

public class PeriodPercentDiscount extends PercentDiscount {
  private final LocalDateTime whenScreened;

  public PeriodPercentDiscount(double pecent, LocalDateTime whenScreened) {
    super(pecent);
    this.whenScreened = whenScreened;
  }

  @Override
  public boolean isSatisfiedBy(Screening screening, int audienceCount) {
    return screening.whenScreened == whenScreened;
  }
}
