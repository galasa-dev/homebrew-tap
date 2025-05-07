cask "galasactl@0.37.0" do
  arch arm: "arm64", intel: "x86-64"

  version "0.37.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "5c4fe2c9e99af4ea21961c1b640a8a509b057eca37c27bfeb685d860c3b88b8c",
         intel: "2a019c7ad7c8158c12380a4a66293291d38fc553cc400caee89b8245263e2bc4"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.37.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
