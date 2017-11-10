shell_session_update() { :; }

function rm_mkdir {
    # Remove directory if present, then make directory
    local path=$1
    if [ -z "$path" ]; then echo "Need not-empty path"; exit 1; fi
    if [ -d "$path" ]; then rm -rf $path; fi
    mkdir $path
}

function local_author {
    # Run in git repository to set commit author
    git config user.email "my@noble.self"
    git config user.name "Noble Self"
}

# Test fill_submodule function
current_wd=$PWD

rm_mkdir tmp_repos
cd tmp_repos
mkdir project
(cd project && git init &&
    echo "Interesting!" > README.txt &&
    git add README.txt &&
    local_author &&
    git commit -m "first project" &&
    git tag first-commit)
