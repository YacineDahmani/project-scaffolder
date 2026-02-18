# Scaffolder

**Welcome to my first shell scripting project!** 🚀

This tool helps automate the process of setting up new projects with boilerplate code and git initialization. I created this to learn more about shell scripting and to speed up my workflow.

## 🛠️ Features

- **Project Scaffolding**: Quickly generate project structures for different tech stacks.
- **Dependency Checking**: Ensures you have the necessary tools (like Node.js, Python, Git) installed before running.
- **Automated Git Setup**: Initializes a git repository, creates a `.gitignore`, and makes the initial commit automatically.
- **Git Helper Tools**: Includes a handy script for common git operations.

## 🚀 How It Works

The core of the project is the `scaffold` script. It takes a project name and a type argument, checks your environment, and then runs specific functions to generate the files you need.

### Usage

To start a new project, run the `scaffold` script:

```bash
./scaffold <project_name> -t <type>
```

### Supported Types

-   `nodejs-fullstack`: Sets up a Node.js backend with a React frontend.
-   `python`: Creates a basic Python project structure.
-   `flask`: Sets up a Flask backend application.
-   `react`: specific React frontend setup.

### Example

```bash
./scaffold my-new-app -t react
```

This command will:
1.  Check if you have `node` and `npm`.
2.  Create the `my-new-app` directory.
3.  Generate the React project structure.
4.  Initialize a git repo and make the first commit.

## 🧰 Git Tools

I've also included a `git-tools` script to simplify daily git tasks.

```bash
./git-tools <command>
```

**Commands:**
-   `push [msg]`: Auto-adds, commits, and pushes changes (default command).
-   `pull`: Pulls changes using rebase.
-   `status`: Shows the current git status.
-   `amend`: Amends the last commit without editing the message.
-   `undo`: Undoes the last commit but keeps changes staged.
-   `log`: Shows a compact git log.

## 📂 Project Structure

-   `scaffold`: The main entry point script.
-   `git-tools`: Helper script for git commands.
-   `lib/`: Contains utility scripts and project templates.
    -   `templates/`: Shell scripts that define how each project type is generated.
    -   `utils.sh`: Common helper functions (logging, dependency checks).
    -   `git_utils.sh`: logical for git automation.
