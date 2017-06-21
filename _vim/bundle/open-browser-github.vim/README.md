# open-browser-github.vim

## About

Opens GitHub URL of current file, etc. from Vim.
Also supports GitHub Enterprise.

## Install

This plugin requires:

* [open-browser.vim](https://github.com/tyru/open-browser.vim)
* `git` command in your PATH

## Usage

There are 3 commands.

### `:OpenGithubFile`

Opens a specific file in github.com repository(it also opens in the current branch by default).

```vimL
" Opens current files URL in github.com
:OpenGithubFile
" Opens current files highlighted place in github.com 
:'<,'>OpenGithubFile
" Opens a specific file in github.com
:OpenGithubFile PATH/TO/FILE
```

### `:OpenGithubIssue`

Opens a specific Issue.

```vimL
" Opens current repositories Issue #1
:OpenGithubIssue 1
" Opens a specific repositories Issue #1
:OpenGithubIssue 1 tyru/open-browser.vim
" Opens current repositories Issue List
:OpenGithubIssue
" Opens a specific repositories Issue list
:OpenGithubIssue tyru/open-browser.vim
```

### `:OpenGithubPullReq`

The third command is `:OpenGithubPullReq`.  It opens `/pulls` page when it has no argument.  Otherwise, it does entirely the same thing as `:OpenGithubIssue` since GitHub redirects `/issues/1` to `/pull/1` if #1 is a Pull Request.

## GitHub Enterprise setting

1. Get entire URL from "hub" command.

If you installed "hub" command, |openbrowser-github| will execute the
following command:

`hub browse -u -- {path}`

And will open a returned (output) URL.

2\. Get each part from "git config --get hub.xxx" output

* hub.protocol (TODO)
* hub.host

Like the [hub command](https://github.com/github/hub),
by setting above keys / values in gitconfig,
you can open a GitHub Enterprise repository page.

For example, you can set 'hub.host' by executing the command below.
Make sure you execute it in the git repository.

`$ git config --local hub.host my.git.org`
