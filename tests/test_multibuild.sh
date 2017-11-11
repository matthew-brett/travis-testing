# Test multibuild utilities
source common_utils.sh
source tests/utils.sh

# Test fill_submodule function
current_wd=$PWD

rm_mkdir tmp_repos
cd tmp_repos
mkdir project
