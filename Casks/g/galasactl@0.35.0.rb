cask "galasactl@0.35.0" do
  arch arm: "arm64", intel: "x86-64"

  version "0.35.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "8bf6aa19fd5ea6e34c40379165892272c67f74c6b11992a9f1840cc72e79e08c",
         intel: "fc0f31701c06e1cfda03ed9c3303776a214cbab3d0d863a3ee4eaf6d5d40c0ff"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.35.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
