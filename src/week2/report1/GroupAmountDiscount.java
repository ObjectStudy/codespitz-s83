package week2.report1;


public class GroupAmountDiscount extends AmountDiscount {
  private final int audienceCount;

  public GroupAmountDiscount(Money amount, int audienceCount) {
    super(amount);
    this.audienceCount = audienceCount;
  }

  @Override
  public boolean isSatisfiedBy(Screening screening, int audienceCount) {
    return this.audienceCount <= audienceCount;
  }
}
