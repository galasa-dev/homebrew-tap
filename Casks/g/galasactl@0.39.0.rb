cask "galasactl@0.39.0" do
  arch arm: "arm64", intel: "x86-64"

  version "0.39.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "da5f15664b6bf780a9e5c996dd74bfb6da62a638c161d3bcc14d2635ab360ebe",
         intel: "c560b421baad70e30c90a9a4f3e9c547aaff567e43ac3302945767e02ccdc13a"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.39.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
