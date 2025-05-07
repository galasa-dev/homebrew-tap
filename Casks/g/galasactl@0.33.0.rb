cask "galasactl@0.33.0" do
  arch arm: "arm64", intel: "x86-64"

  version "0.33.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "2965195ff7da084a3b60e48547f6ffc26bada6ae7bfebcf3c804041cd829f8cc",
         intel: "c60ab567dc246422507146460feb44f367e176bbfa69b33bdf232c56977f768e"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.33.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
