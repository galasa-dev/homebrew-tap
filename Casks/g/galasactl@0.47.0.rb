#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.47.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.47.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "1992b7701210095ccd46051511fdd2122107ff04cfe86f9d3cd5d4cc7d2ddec6",
         intel: "802f760406c45a0e0a35e4d6ba2eafaa8ad1041603a19610302b2aeda219801d"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.47.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
