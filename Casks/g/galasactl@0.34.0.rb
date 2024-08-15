cask "galasactl@0.34.0" do
  arch arm: "arm64", intel: "x86-64"
  
  version "0.34.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "f6db24d394dcda85d0a6c93d24279f0e99a149c842fb2628b13c82409f794fd0",
         intel: "47971b6d3427f4f3d9721ddcd98e6bfde73560d95df43f6a40837d6fd79f0f08"

  url "https://github.com/galasa-dev/cli/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/cli/releases/"
  name "Galasa Client"
  desc "Client to interact with the Galasa ecosystem or local development environment"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
