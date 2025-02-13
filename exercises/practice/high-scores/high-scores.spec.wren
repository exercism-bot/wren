import "wren-testie/testie" for Testie, Expect
import "./high-scores" for HighScores

Testie.test("High scores") { |do, skip|
  do.test("List of scores") {
    var input = [30, 50, 20, 70]
    Expect.that(HighScores.new(input).scores).toEqual([30, 50, 20, 70])
  }

  skip.test("Latest score") {
    var input = [100, 0, 90, 30]
    Expect.that(HighScores.new(input).latest).toEqual(30)
  }

  skip.test("Personal best") {
    var input = [40, 100, 70]
    Expect.that(HighScores.new(input).personalBest).toEqual(100)
  }

  do.describe("Top 3 scores") {
    skip.test("Personal top three from a list of scores") {
      var input = [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
      Expect.that(HighScores.new(input).personalTopThree).toEqual([100, 90, 70])
    }

    skip.test("Personal top highest to lowest") {
      var input = [20, 10, 30]
      Expect.that(HighScores.new(input).personalTopThree).toEqual([30, 20, 10])
    }

    skip.test("Personal top when there is a tie") {
      var input = [40, 20, 40, 30]
      Expect.that(HighScores.new(input).personalTopThree).toEqual([40, 40, 30])
    }

    skip.test("Personal top when there are less than 3") {
      var input = [30, 70]
      Expect.that(HighScores.new(input).personalTopThree).toEqual([70, 30])
    }

    skip.test("Personal top when there is only one") {
      var input = [40]
      Expect.that(HighScores.new(input).personalTopThree).toEqual([40])
    }
  }
}
