#!/usr/bin/env bash

bundle exec middleman build --clean

prev_branch=`git rev-parse --abbrev-ref HEAD`
commit_hash=`git log -n 1 --format="%H" HEAD`

repo="origin"
build_dir="build"
deploy_branch="gh-pages"

if git ls-remote --exit-code "${repo}" "refs/heads/${deploy_branch}"; then
    git fetch --force "${repo}" "${deploy_branch}:${deploy_branch}"
fi

if git show-ref --verify --quiet "refs/heads/${deploy_branch}" then
    deploy_incremental
else
    deploy_initial
fi

if [[ "${pre_branch}" = "HEAD" ]]; then
    git update-ref --no-deref HEAD "${commit_hash}" "${deploy_branch}"
else
    git symbolic-ref HEAD "refs/heads/${prev_branch}"
fi

git reset --mixed

deploy_initial() {
    git --work-tree "${build_dir}" checkout --orphan "${deploy_branch}"
    git --work-tree "${build_dir}" add --all

    commit
}

deploy_incremental() {
    git symbolic-ref HEAD "refs/heads/${deploy_branch}"

    git --work-tree "${build_dir}" reset --mixed --quiet
    git --work-tree "${build_dir}" add --all

    set +o errexit
    diff=$(git --work-tree "${build_dir}" diff --exit-code --quiet HEAD --)$?
    set -o errexit

    case "${diff}" in
        0)
            echo "No changes found, no need to deploy."

            ;;
        1)
            commit

            ;;
        *)
            echo "Diff exited with code ${diff}. No idea what that means. Just gonna leave you here to figure it out."

            return $diff

            ;;
    esac
}

commit() {
    git --work-tree "${build_dir}" commit -m "Publish updated docs"

    echo "Ready to push."
}