#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.44.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.44.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "ac1d1f18a308f627fa63280d3aa8b127cc1de61c3533bf4872a44ee5972bd79c",
         intel: "3d056cbf66d23ec86e348967b581a0235832fb4d8408212563486594dd623ee5"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.44.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
