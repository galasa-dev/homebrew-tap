#! /usr/bin/env bash

#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

#-----------------------------------------------------------------------------------------
#
# Objectives: Add a new version of galasactl to this tool.
#
#-----------------------------------------------------------------------------------------

# Where is this script executing from ?
BASEDIR=$(dirname "$0");pushd $BASEDIR 2>&1 >> /dev/null ;BASEDIR=$(pwd);popd 2>&1 >> /dev/null
# echo "Running from directory ${BASEDIR}"
export ORIGINAL_DIR=$(pwd)
# cd "${BASEDIR}"

cd "${BASEDIR}/.."
WORKSPACE_DIR=$(pwd)

#-----------------------------------------------------------------------------------------
#
# Set Colors
#
#-----------------------------------------------------------------------------------------
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 76)
white=$(tput setaf 7)
tan=$(tput setaf 202)
blue=$(tput setaf 25)

#-----------------------------------------------------------------------------------------
#
# Headers and Logging
#
#-----------------------------------------------------------------------------------------
underline() { printf "${underline}${bold}%s${reset}\n" "$@" ;}
h1() { printf "\n${underline}${bold}${blue}%s${reset}\n" "$@" ;}
h2() { printf "\n${underline}${bold}${white}%s${reset}\n" "$@" ;}
debug() { printf "${white}%s${reset}\n" "$@" ;}
info() { printf "${white}➜ %s${reset}\n" "$@" ;}
success() { printf "${green}✔ %s${reset}\n" "$@" ;}
error() { printf "${red}✖ %s${reset}\n" "$@" ;}
warn() { printf "${tan}➜ %s${reset}\n" "$@" ;}
bold() { printf "${bold}%s${reset}\n" "$@" ;}
note() { printf "\n${underline}${bold}${blue}Note:${reset} ${blue}%s${reset}\n" "$@" ;}

#-----------------------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------------------
function usage {
    info "Syntax: add-version.sh [OPTIONS]"
    cat << EOF
Options are:
-v | --version {version}: For example 0.36.0. Whichever version you put here we will try to locate and process.
-h | --help : Display this help text.
EOF
}

#-------------------------------------------------------------
function check_exit_code () {
    # This function takes 2 parameters in the form:
    # $1 an integer value of the returned exit code
    # $2 an error message to display if $1 is not equal to 0
    if [[ "$1" != "0" ]]; then 
        error "$2" 
        exit 1  
    fi
}

function download_executable() {
    url_to_download_from=$1
    download_target_file_path=$2
    h2 "Downloading from $url_to_download_from to $download_target_file_path"
    response_code=$(curl -L --silent --write-out '%{response_code}' -o $download_target_file_path $url_to_download_from)
    if [[ "$response_code" != "200" ]]; then error "Failed to download version $version_to_add from url $url_to_download_from. Exit code from curl was $response_code" ; exit 1 ; fi
    success "downloaded OK."
}

function create_new_version_formula() {
    x86_checksum=$1 
    arm64_checksum=$2
    formula_file_path="$BASEDIR/Casks/g/galasactl@$version_to_add.rb"
    h2 "Creating new formula file $formula_file_path"

    cat << EOF > ${formula_file_path}
#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@${version_to_add}" do
  arch arm: "arm64", intel: "x86_64"

  version "${version_to_add}"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "${arm64_checksum}",
         intel: "${x86_checksum}"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version ${version_to_add}"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
EOF

    check_exit_code $? "Failed to create the formula file $formula_file_path"
    success "Formula file created OK."
}


function update_latest_formula() {
    x86_checksum=$1 
    arm64_checksum=$2
    formula_file_path="$BASEDIR/Casks/g/galasactl.rb"
    h2 "Updating latest-version formula file $formula_file_path"

    cat << EOF > $formula_file_path
#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl" do
  arch arm: "arm64", intel: "x86_64"

  version "$version_to_add"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "${arm64_checksum}",
         intel: "${x86_checksum}"

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
EOF

    check_exit_code $? "Failed to update the formula file $formula_file_path"
    success "Formula file updated OK."
}


function update_readme_example() {
    h2 "Updating the example in the readme."
    cat $BASEDIR/README.md | sed -E "s/[0-9]+[.][0-9]+[.][0-9\.]*/${version_to_add}/g" > ${BASEDIR}/temp/README1.md
    mv ${BASEDIR}/temp/README1.md ${BASEDIR}/README.md
    success "Readme updated OK."
}

#-----------------------------------------------------------------------------------------
# Process parameters
#-----------------------------------------------------------------------------------------
version_to_add=""
while [ "$1" != "" ]; do
    case $1 in
        -v | --version )        shift
                                version_to_add="$1"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     error "Unexpected argument $1"
                                usage
                                exit 1
    esac
    shift
done

if [[ "${version_to_add}" == "" ]]; then
    error "Need to use the --version {version} parameter."
    usage
    exit 1
fi

h1 "Adding version $version_to_add"

mkdir -p $BASEDIR/temp
check_exit_code $? "couldn't  create a temporary folder"

url_to_download_from=https://github.com/galasa-dev/galasa/releases/download/v${version_to_add}/galasactl-darwin-x86_64

# Work out the base name of the file we want to download.
target_file_name=$(echo $url_to_download_from | sed "s/.*\///")
target_file_path=${BASEDIR}/temp/$target_file_name
download_executable $url_to_download_from $target_file_path
x86_checksum=$(shasum --algorithm 256 $target_file_path | cut -f1 -d' ')
info "x86 checksum is $x86_checksum"

url_to_download_from=https://github.com/galasa-dev/galasa/releases/download/v${version_to_add}/galasactl-darwin-arm64

# Work out the base name of the file we want to download.
target_file_name=$(echo $url_to_download_from | sed "s/.*\///")
target_file_path=${BASEDIR}/temp/$target_file_name
download_executable $url_to_download_from $target_file_path

arm64_checksum=$(shasum --algorithm 256 $target_file_path | cut -f1 -d' ')
info "arm64 checksum is $arm64_checksum"

create_new_version_formula $x86_checksum $arm64_checksum

update_latest_formula $x86_checksum $arm64_checksum

update_readme_example

success "All done OK."