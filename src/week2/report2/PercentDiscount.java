package week2.report2;

abstract public class PercentDiscount implements DiscountPolicy.PERCENT, DiscountCondition {
  private final double pecent;

  PercentDiscount(double pecent) {
    this.pecent = pecent;
  }

  @Override public final Money calculateFee(Money fee) { 
    return fee.minus(fee.multi(pecent));
  }
}