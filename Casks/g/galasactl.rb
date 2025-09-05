#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl" do
  arch arm: "arm64", intel: "x86_64"

  version "0.43.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "bb075d84b1ff9eb22f812b030542f5845b05cb3ef5e4959bb555bbd9cc9e2a49",
         intel: "7c0818a4e98ffdbfe2ada0a4c970848ab4883c95f0b2d071076d3ce026542d16"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Latest version"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
