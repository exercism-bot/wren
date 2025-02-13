import "./queen-attack" for QueenAttack
import "wren-testie/testie" for Testie, Expect

Testie.test("Queens") { |do, skip|
  do.describe("Test creation of Queens with valid and invalid positions") {
    do.test("queen with a valid position") {
      var queens = QueenAttack.new({ "white": [2, 2] })
      Expect.that(queens.white).toEqual([2, 2])
    }

    skip.test("queen must have positive row") {
      var positioning = { "white": [-2, 2] }
      var expectedError = "Queen must be placed on the board"
      Expect.that { QueenAttack.new(positioning) }.abortsWith(expectedError)
    }

    skip.test("queen must have row on board") {
      var positioning = { "white": [8, 4] }
      var expectedError = "Queen must be placed on the board"
      Expect.that { QueenAttack.new(positioning) }.abortsWith(expectedError)
    }

    skip.test("queen must have positive column") {
      var positioning = { "white": [2, -2] }
      var expectedError = "Queen must be placed on the board"
      Expect.that { QueenAttack.new(positioning) }.abortsWith(expectedError)
    }

    skip.test("queen must have column on board") {
      var positioning = { "white": [4, 8] }
      var expectedError = "Queen must be placed on the board"
      Expect.that { QueenAttack.new(positioning) }.abortsWith(expectedError)
    }

    skip.test("two queens cannot occupy the same space") {
      var positioning = { "white": [2, 4], "black": [2, 4] }
      var expectedError = "Queens cannot share the same space"
      Expect.that { QueenAttack.new(positioning) }.abortsWith(expectedError)
    }
  }

  do.describe("Test the ability of one queen to attack another") {
    skip.test("queens cannot attack") {
      var queens = QueenAttack.new({ "white": [2, 4], "black": [6, 6] })
      Expect.that(queens.canAttack).toEqual(false)
    }

    skip.test("queens can attack when they are on the same row") {
      var queens = QueenAttack.new({ "white": [2, 4], "black": [2, 6] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack when they are on the same column") {
      var queens = QueenAttack.new({ "white": [4, 5], "black": [2, 5] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack diagonally") {
      var queens = QueenAttack.new({ "white": [2, 2], "black": [0, 4] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack another diagonally") {
      var queens = QueenAttack.new({ "white": [2, 2], "black": [3, 1] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack yet another diagonally") {
      var queens = QueenAttack.new({ "white": [2, 2], "black": [1, 1] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack diagonally, really") {
      var queens = QueenAttack.new({ "white": [1, 7], "black": [0, 6] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack on a north-east/south-west diagonal") {
      var queens = QueenAttack.new({ "white": [7, 0], "black": [0, 7] })
      Expect.that(queens.canAttack).toEqual(true)
    }

    skip.test("queens can attack on another ne/sw diagonal") {
      var queens = QueenAttack.new({ "white": [2, 6], "black": [5, 3] })
      Expect.that(queens.canAttack).toEqual(true)
    }
  }

  do.describe("Test the board visualisation") {
    skip.test("board") {
      var positioning = { "white": [3, 2], "black": [6, 5] }
      var queens = QueenAttack.new(positioning)
      var board = [
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ W _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ B _ _",
        "_ _ _ _ _ _ _ _",
      ].join("\n")
      Expect.that(queens.toString).toEqual(board)
    }

    skip.test("board with queens at their starting positions") {
      var queens = QueenAttack.new()
      var board = [
        "_ _ _ B _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ W _ _ _ _",
      ].join("\n")
      Expect.that(queens.toString).toEqual(board)
    }

    skip.test("board with the black queen at her starting positions") {
      var queens = QueenAttack.new({ "white": [1, 6] })
      var board = [
        "_ _ _ B _ _ _ _",
        "_ _ _ _ _ _ W _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
      ].join("\n")
      Expect.that(queens.toString).toEqual(board)
    }

    skip.test("board with queens at the edges") {
      var positioning = { "white": [0, 0], "black": [7, 7] }
      var queens = QueenAttack.new(positioning)
      var board = [
        "W _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ _",
        "_ _ _ _ _ _ _ B",
      ].join("\n")
      Expect.that(queens.toString).toEqual(board)
    }
  }
}
