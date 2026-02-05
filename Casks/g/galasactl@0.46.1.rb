#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.46.1" do
  arch arm: "arm64", intel: "x86_64"

  version "0.46.1"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "52c4fcca867c35494117eebc660b510da5de7bfa7f5cb2854508893f537fed19",
         intel: "6f7325a0be6161ee4405756fcd7ce15a68251c80412252e0c63aa99475c1dd8d"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.46.1"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
