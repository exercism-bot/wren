import "wren-testie/testie" for Testie, Expect
import "./leap" for Year

Testie.test("Leap year") { |do, skip|
  do.test("year not divisible by 4 in common year") {
    Expect.that(Year.isLeap(2015)).toBe(false)
  }

  skip.test("year divisible by 2, not divisible by 4 in common year") {
    Expect.that(Year.isLeap(1970)).toBe(false)
  }

  skip.test("year divisible by 4, not divisible by 100 in leap year") {
    Expect.that(Year.isLeap(1996)).toBe(true)
  }

  skip.test("year divisible by 4 and 5 is still a leap year") {
    Expect.that(Year.isLeap(1960)).toBe(true)
  }

  skip.test("year divisible by 100, not divisible by 400 in common year") {
    Expect.that(Year.isLeap(2100)).toBe(false)
  }

  skip.test("year divisible by 100 but not by 3 is still not a leap year") {
    Expect.that(Year.isLeap(1900)).toBe(false)
  }

  skip.test("year divisible by 400 in leap year") {
    Expect.that(Year.isLeap(2000)).toBe(true)
  }

  skip.test("year divisible by 400 but not by 125 is still a leap year") {
    Expect.that(Year.isLeap(2400)).toBe(true)
  }

  skip.test("year divisible by 200, not divisible by 400 in common year") {
    Expect.that(Year.isLeap(1800)).toBe(false)
  }
}
