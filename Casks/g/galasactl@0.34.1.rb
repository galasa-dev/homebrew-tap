cask "galasactl@0.34.1" do
  arch arm: "arm64", intel: "x86-64"

  version "0.34.1"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "9336ff87dfe927a5fd07f5d59cffeb165680e4ce08ed199350810513b94ad85e",
         intel: "f3be42f09c4b1dc0765c8c381bbb73f7095aa2d133bbd5916763ee025401ba17"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to interact with the Galasa ecosystem or local development environment"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
