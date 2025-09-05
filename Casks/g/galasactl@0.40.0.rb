#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.40.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.40.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "061a424eb1cb2265e60465049774cc57f78de5d47636503a397493634275622e",
         intel: "c3faf4971118b8f7c2d6808af85ab3f6cc3b12d9cc17c713a606d04ddb8ea5db"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.40.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
