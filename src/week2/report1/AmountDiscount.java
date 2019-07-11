package week2.report1;

abstract public class AmountDiscount implements DiscountPolicy.AMOUNT, DiscountCondition {
  private final Money amount;

  AmountDiscount(Money amount) {
    this.amount = amount;
  }

  @Override
  public final Money calculateFee(Money fee) {
    return fee.minus(amount);
  }
}
