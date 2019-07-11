package week2.report1;

interface DiscountPolicy {
  interface AMOUNT extends DiscountPolicy {
  }
  interface PERCENT extends DiscountPolicy {
  }
  interface COUNT extends DiscountPolicy {
  }
  interface NONE extends DiscountPolicy{}
}
