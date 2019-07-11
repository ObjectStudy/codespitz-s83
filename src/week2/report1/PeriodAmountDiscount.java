package week2.report1;

import java.time.LocalDateTime;

public class PeriodAmountDiscount extends AmountDiscount {
  private final LocalDateTime whenScreened;

  public PeriodAmountDiscount(Money amount, LocalDateTime whenScreened) {
    super(amount);
    this.whenScreened = whenScreened;
  }

  @Override
  public boolean isSatisfiedBy(Screening screening, int audienceCount) {
    return screening.whenScreened == whenScreened;
  }
}
