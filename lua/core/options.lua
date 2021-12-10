local function load_options()
    local global_local = {
        encoding = "utf-8";
        autowriteall = true; -- 在文件之间跳转时，自动保存文件
        mouse = "a"; -- 允许使用鼠标
        ignorecase = true; -- 忽略大小写
        smartcase = true;
        background = "dark";
	    termguicolors = true;
    }
    
    local window_local = {
        number = true;
        relativenumber = true;
        cursorline = true;
        wrap = false;
        scrolloff = 7;
        foldmethod = "manual";
    }
    
    local buffer_local = {
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
        softtabstop = 4;
        smartindent = true;
        syntax = "ON"
    }

    local global_var = {
        mapleader = ' '
    }

    for name,value in pairs(global_var) do
        vim.g[name] = value
    end

    for name,value in pairs(global_local) do 
	    vim.o[name] = value
    end

    for name,value in pairs(window_local) do
	    vim.wo[name] = value
    end

    for name,value in pairs(buffer_local) do
    	vim.bo[name] = value
    end

end

load_options()
