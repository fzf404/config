fish_add_path /opt/homebrew/bin /Users/fzf404/.bun/bin

fnm env | source
zoxide init fish | source
starship init fish | source

alias v='hx'
alias c='bat'
alias t='bumpp'
alias r='trash'
alias l='ls -lah'

alias b="bun"
alias bi="bun install"
alias ba="bun add"
alias bd="bun dev"
alias bb="bun build"

alias br="brew"
alias bri="brew install"
alias brui="brew uninstall"
alias brl="brew list"
alias brif="brew info"
alias brs="brew search"
alias bru="brew upgrade -g"

alias n='pnpm'
alias ny='pnpm why'
alias np='pnpm publish'
alias nlg='pnpm list -g'

alias na='pnpm add'
alias nad='pnpm add -D'
alias nag='pnpm add -g'

alias nr='pnpm rm'
alias nrg='pnpm rm -g'

alias ni='pnpm install'
alias nir='pnpm install --recursive'

alias nu='pnpm update'
alias nul='pnpm update --latest --interactive'

alias nd='pnpm run dev'
alias nrd='pnpm run -r dev'
alias nb='pnpm run build'
alias nrb='pnpm run -r build'
alias ndp='pnpm run deploy'
alias nrdp='pnpm run -r deploy'

alias nl='pnpm run lint'
alias nf='pnpm run format'
alias nle='pnpm run lint:eslint'
alias nlp='pnpm run lint:prettier'
alias nls='pnpm run lint:stylelint'

alias nt='pnpm run test'
alias ns='pnpm run start'
alias nck='pnpm run check'
alias nrl='pnpm run release'
alias npv='pnpm run preview'
alias ng='pnpm run generate'

alias ntp='t && np'
alias nbp='t -x "pnpm run build" && np'

alias g='gitcz --disable-emoji'

alias ga='git add -A'
alias gc='git clone'
alias gb='git checkout --orphan'
alias gp='git push'
alias gpl='git pull'
alias gcp='g && gp'
alias gap='ga && gcp'
alias gctp='g && ntp'
alias gcbp='g && nbp'
alias gatp='ga && gctp'
alias gabp='ga && gcbp'

alias ghc='gh repo clone'

alias u='/Applications/HBuilderX.app/Contents/MacOS/cli'
alias ua='u cloud functions --upload all --prj BonjourApp --provider aliyun --force'
alias uc='u cloud functions --upload common --prj BonjourApp --provider aliyun --force --name'
alias ur='u cloud functions --upload cloudfunction --prj BonjourApp --provider aliyun --force --name'

function qrc
    curl qrenco.de/$argv
end

function proxy
    set -gx http_proxy http://127.0.0.1:6152
    set -gx https_proxy http://127.0.0.1:6152
    set -gx all_proxy socks5://127.0.0.1:6153
end

function unproxy
    set -gu http_proxy
    set -gu https_proxy
    set -gu all_proxy
end

function ghbot --argument owner
    test -n "$owner"; or set owner fzf404
    gh search prs --owner $owner is:open archived:false label:dependencies --json url --jq ".[].url" | xargs -I URL bash -c 'echo "Approving & Merging: URL" && gh pr review --approve URL && gh pr merge --squash --auto URL'
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/homebrew/Caskroom/miniconda/base/bin $PATH
    end
end
# <<< conda initialize <<<


# pnpm
set -gx PNPM_HOME /Users/fzf404/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
