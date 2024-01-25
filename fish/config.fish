fish_add_path /opt/homebrew/bin /Users/fzf404/Library/pnpm

fnm env | source
zoxide init fish | source
starship init fish | source
eval conda 'shell.fish' hook $argv | source
set -gx PNPM_HOME /Users/fzf404/Library/pnpm

alias v='hx'
alias c='bat'
alias t='bumpp'
alias r='trash'
alias l='ls -lah'

alias bi="brew install"
alias bif="brew info"
alias b="brew install"
alias bs="brew search"
alias bu="brew upgrade --greedy"

alias n='pnpm'
alias ny='pnpm why'
alias na='pnpm add'
alias nad='pnpm add -D'
alias nag='pnpm add -g'
alias ni='pnpm install'
alias nu='pnpm update'
alias nul='pnpm update --latest --interactive'
alias np='pnpm publish'
alias nd='pnpm run dev'
alias nt='pnpm run test'
alias nl='pnpm run lint'
alias nf='pnpm run format'
alias nle='pnpm run lint:eslint'
alias nlp='pnpm run lint:prettier'
alias nls='pnpm run lint:stylelint'
alias ns='pnpm run start'
alias nb='pnpm run build'
alias nck='pnpm run check'
alias nr='pnpm run release'
alias npv='pnpm run preview'
alias ng='pnpm run generate'
alias ndp='pnpm run deploy'
alias ntp='t && np'
alias nbp='t -x "pnpm run build" && np'

alias g='gitcz --disable-emoji'

alias ga='git add -A'
alias gc='git commit -m'
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
