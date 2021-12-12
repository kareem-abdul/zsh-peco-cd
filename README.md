# zsh-peco-cd
Search directories with [peco](https://github.com/peco/peco) when pressing ctrl+f

**NOTE: By default the plugin will only query for directories under the curent users home directory.
ie for non root users this would be `$HOME` and for root `/`**


Based on [zsh-peco-history](https://github.com/jimeh/zsh-peco-history).

![screenshot](https://github.com/kareem-abdul/zsh-peco-cd/raw/main/screenshot.png)

## usage

 1. press ctrl + f when in zsh shell
 2. start typing to filter out your directory
 3. press enter/return to pick a directory to change to

## Installation

### Manual

 1. clone this repo to your machine. This guide uses `~/.zsh/zsh-peco-cd`

    ```sh
    git clone https://github.com/kareem-abdul/zsh-peco-cd.git ~/.zsh/zsh-peco-cd
    ```
 2. Add the following to your `.zshrc`:
    ```sh
    source ~/.zsh/zsh-peco-cd/zsh-peco-cd.zsh
    ```
 3. Start a new terminal session

### [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

 1. Clone this repo into `$ZSH_CUSTOM/plugins` (by default this is ~/.oh-my-zsh/custom/plugins)
    ```sh
    git clone https://github.com/kareem-abdul/zsh-peco-cd.git ${ZSH_CUSTOM:~/.oh-my-zsh/custom}/plugins/zsh-peco-cd
    ```
 2. Add the plugin to the list of plugins in your `.zshrc` for Oh My Zsh to load:
    ```sh
    plugin=(zsh-peco-cd)
    ```
 3. Start a new terminal session

## Configuration Options

 ### `ZSH_PECO_CD_IGNORE_PATHS`
 
 These are the directories in regex which this plugin ignores.
 This by default is set to `node_modules|\.git|\.cache|\.config`, ie any directory which has the above 
 names will be ignored and will not be listed in the peco menu

 ### `ZSH_PECO_CD_ROOT`

 By default the plugin will only query for directories under the curent users home directory.
 ie for non root users this would be `$HOME` and for root `/`
 
 You can change this behaviour by specifying a directory in the `ZSH_PECO_CD_ROOT`
 ie `ZSH_PECO_CD_ROOT="$HOME/workspace"` will only search the directories and subdirecotries under 
 `$HOME/workspace`

