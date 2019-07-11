package week2.report1;


public class GroupPercentDiscount extends PercentDiscount {
  private final int audienceCount;

  public GroupPercentDiscount(double pecent, int audienceCount) {
    super(pecent);
    this.audienceCount = audienceCount;
  }

  @Override
  public boolean isSatisfiedBy(Screening screening, int audienceCount) {
    return this.audienceCount <= audienceCount;
  }
}
