import "wren-package/package" for WrenPackage, Dependency
import "os" for Process

class Package is WrenPackage {
  construct new() {}
  name { "exercism/robot-simulator" }
  dependencies {
    return [
      Dependency.new("wren-testie", "0.1.1", "https://github.com/joshgoebel/wren-testie.git")
    ]
  }
}

Package.new().default()
