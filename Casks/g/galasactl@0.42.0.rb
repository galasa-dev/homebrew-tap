#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.42.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.42.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "a587ff66f7bb9309c8b96d135e6c6512ec0decf139eaee225d0b57afb2f98312",
         intel: "931f090d13c61431d75b78f5f6b1d7df4104e76708770a4219ee9e98c2dc58af"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.42.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
