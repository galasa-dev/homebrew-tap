#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.46.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.46.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "12f12ef4aa9f39c26d5862c90218a93fd8203bbcfef73fb2cc1fb83f07813877",
         intel: "f4ed892dcaf8aa1c8bf0f7485025d35c3230e27aaf158678ada10fe6f13d4490"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.46.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
