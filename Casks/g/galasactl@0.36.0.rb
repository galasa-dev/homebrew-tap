cask "galasactl@0.36.0" do
  arch arm: "arm64", intel: "x86-64"

  version "0.36.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "d162571e1fa71d78f0d625d4feb6d17da21da54b5888f6fedc52902330accf98",
         intel: "a1ad08b22a1ca6f8f0755e34aec2a4b69ffee19450966753ba9a9f938c481653"

  url "https://github.com/galasa-dev/cli/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/cli/releases/"
  name "Galasa Client"
  desc "Client to interact with the Galasa ecosystem or local development environment. Version 0.36.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
