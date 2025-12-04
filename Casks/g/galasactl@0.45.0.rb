#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.45.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.45.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "53ba402af54e58c144e38ea2c1fb9428acb8901b9bf635db1ebd67283e6b5aa2",
         intel: "0eb835950ed792e955debe1258136c5dfa0c1dc3cd895d0e3cdad0d57ceaff49"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.45.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
