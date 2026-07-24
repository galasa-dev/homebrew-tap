#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@1.0.0" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "acbde36d4ab0c87c4e5521de77c00afd60c310a1e704922af9ff5d5fa7e9a346",
         intel: "0d98a23185f250b6d41fb00fe97ca314c681da0aaa95e75235e90ac7d6e2ea74"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 1.0.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
