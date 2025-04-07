cask "galasactl@0.38.0" do
  arch arm: "arm64", intel: "x86-64"

  version "0.38.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "9197b02b7c232791900cbad5bed49f30a1f6e2154259e692416c8787d24a9d31",
         intel: "66d49325c4494c0585b734b070ca917e7da29c036b99348b754b435b66e134e3"

  url "https://github.com/galasa-dev/cli/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/cli/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally.. Version 0.38.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
