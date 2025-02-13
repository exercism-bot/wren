import "wren-testie/testie" for Testie, Expect
import "./reverse-string" for StringUtil

Testie.test("Hello World") { |do, skip|
  do.test("empty string") {
    var expected = ""
    var actual = StringUtil.reverse("")
    Expect.that(actual).toEqual(expected)
  }

  skip.test("a word") {
    var expected = "tobor"
    var actual = StringUtil.reverse("robot")
    Expect.that(actual).toEqual(expected)
  }

  skip.test("a capitalized word") {
    var expected = "nemaR"
    var actual = StringUtil.reverse("Ramen")
    Expect.that(actual).toEqual(expected)
  }

  skip.test("a sentence with punctuation") {
    var expected = "!yrgnuh ma I"
    var actual = StringUtil.reverse("I am hungry!")
    Expect.that(actual).toEqual(expected)
  }

  skip.test("a palindrome") {
    var expected = "racecar"
    var actual = StringUtil.reverse("racecar")
    Expect.that(actual).toEqual(expected)
  }

  skip.test("an even-sized word") {
    var expected = "reward"
    var actual = StringUtil.reverse("drawer")
    Expect.that(actual).toEqual(expected)
  }
}
