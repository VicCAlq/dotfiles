if status is-interactive
    # Commands to run in interactive sessions can go here
    # oh-my-posh init fish | source
    oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/tokyonight_storm.omp.json | source
    # source ~/.asdf/asdf.fish
end

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
fish_add_path -m ~/Apps/
fish_add_path -m ~/Apps/Neovim/
alias love="love-11.5-x86_64.AppImage"

# source /home/vicmca/CodeProjects/sonarqube/scanner/bin/sonar-scanner
# alias frontscan-coverage "npm run generate-lcov-report; sonar-scanner"
# alias backscan-coverage "coverage run manage.py test && coverage xml; sonar-scanner"

# flatpak aliases
alias wezterm="flatpak run org.wezfurlong.wezterm"

# exa aliases
alias examain="exa --all --long --header --git --classify --sort=ext --group-directories-first --icons"
alias exagrid="exa --all --grid --header --git --classify --sort=ext --group-directories-first --icons"
alias exatree="exa --all --long --tree --header --git --classify --sort=ext --group-directories-first --icons --ignore-glob=\"*node_modules|.git|*venv|__pycache__\""
alias exafull="exa --all --long --tree --header --git --classify --sort=ext --group-directories-first --icons"
alias exaext="exa --all --long --header --git --sort=ext --group-directories-first --icons --extended --classify"
alias exahelp="printf \"examain = long, header\nexagrid - grid, header\nexatree = long, tree\nexafull = exe + git, node_modules, etc\nexaext = exz extended\nexahelp = This help\""

# Neovim configs
alias nvim="~/Apps/neovim/nvim-0.10.1.appimage"
alias nv="NVIM_APPNAME=nvim-clean ~/Apps/neovim/nvim-0.10.1.appimage"
alias kvim="NVIM_APPNAME=nvim-kick ~/Apps/neovim/nvim-0.10.1.appimage"
alias gv="NVIM_APPNAME=nvim-grimm ~/Apps/neovim/nvim-0.10.1.appimage"
alias tv="NVIM_APPNAME=nvim-tj ~/Apps/neovim/nvim-0.10.1.appimage"
alias cv="NVIM_APPNAME=nvim-custom ~/Apps/neovim/nvim-0.10.1.appimage"

# Ollama docker
alias ollama-pull="docker pull ollama/ollama"
alias ollama-init="docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama"
alias ollama="docker exec -it ollama ollama"

# Other aliases
alias bat="batcat"
alias htop="btop"
alias powertop="sudo powertop"
alias python="python3"
alias ds="dust"
alias grepstring="echo \"Command = grep --exclude-dir={dist,nginx,node_modules} -rnw './' -e 'text_to_be_searched'\" && grep --exclude-dir={dist,nginx,node_modules} -rnw './' -e"

alias lochelp="echo \"find <dir> -name '*.extension' | xargs wc -l\""

alias gitac="git add . && git commit -m"
alias gitup="git checkout main && git fetch --all && git pull"

# Sobressalentes
alias dcredo="docker-compose rm -y && docker-compose down && docker-compose up --build -d; sleep 40; python scripts/db_create.py && python scripts/sobressalentes_create.py && python manage.py makemigrations dashboard && python manage.py makemigrations entire_units && python manage.py makemigrations authentication && python manage.py migrate --database=mssql_pocp && python manage.py migrate && python manage.py seed && python manage.py populate && python manage.py runserver"
alias dcstart="docker-compose stop && docker-compose up -d; sleep 40; python manage.py runserver"
alias dcstop="docker-compose stop"
alias fstart="npm run dev"
alias gob="cd ~/CodeProjects/CESAR/Petro/t12/estimador_de_sobressalentes/backend/ && . venv/bin/activate.fish"
alias gof="cd ~/CodeProjects/CESAR/Petro/t12/estimador_de_sobressalentes/frontend/"
