#!/usr/bin/env bash

init_git_repo() {
    local project_dir=$1
    if [ -d "$project_dir/.git" ]; then
        log_warning "Git repository already exists in $project_dir"
        return
    fi
    git init "$project_dir"
    log_success "Initialized empty Git repository in $project_dir"
}

create_gitignore() {
    local project_dir=$1
    shift
    local ignores=("$@")
    
    local gitignore_path="$project_dir/.gitignore"
    
    # Always add common ignores
    echo ".DS_Store" >> "$gitignore_path"
    echo ".env" >> "$gitignore_path"
    
    for ignore in "${ignores[@]}"; do
        echo "$ignore" >> "$gitignore_path"
    done
    log_info "Created .gitignore"
}

git_commit_all() {
    local msg="${1:-Initial commit}"
    git add .
    git commit -m "$msg"
    log_success "Committed changes: $msg"
}

git_create_gh_repo() {
    local name=$1
    local private=${2:-true}
    
    local visibility_flag="--public"
    if [ "$private" = "true" ]; then
        visibility_flag="--private"
    fi

    if command -v gh &> /dev/null; then
        log_info "Creating GitHub repository '$name'..."
        gh repo create "$name" $visibility_flag --source=. --push --confirm || log_warning "Failed to create GitHub repo. You may need to authenticate 'gh' or create it manually."
    else
        log_warning "'gh' CLI not found. Skipping GitHub repository creation."
    fi
}

git_auto_push() {
    local branch=$(git branch --show-current)
    local msg="${1:-Auto update}"
    
    git add -A
    if git diff --staged --quiet; then
        log_info "No changes to commit."
    else
        git commit -m "$msg"
        log_success "Committed: $msg"
    fi
    
    log_info "Pushing to origin/$branch..."
    git push origin "$branch" || log_error "Failed to push to origin/$branch"
}
