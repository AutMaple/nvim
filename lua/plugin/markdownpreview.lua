-- set to 1, nvim will open the preview window after entering the markdown buffer
-- default: 0
-- auto open preview window when opening markdown file
vim.g.mkdp_auto_start = 0

-- use custom IP to open preview page
-- useful when you work in remote vim and preview on local browser
-- more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
-- default empty
-- vim.g.mkdp_open_ip = ''

-- specify browser to open preview page
-- default: ''
-- vim.g.mkdp_browser = ''

-- options for markdown render
-- mkit: markdown-it options for render
-- katex: katex options for math
-- uml: markdown-it-plantuml options
-- maid: mermaid options
-- disable_sync_scroll: if disable sync scroll, default 0
-- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
--   middle: mean the cursor position alway show at the middle of the preview page
--   top: mean the vim top viewport alway show at the top of the preview page
--   relative: mean the cursor position alway show at the relative positon of the preview page
-- hide_yaml_meta: if hide yaml metadata, default is 1
-- sequence_diagrams: js-sequence-diagrams options
-- content_editable: if enable content editable for preview page, default: v:false
-- disable_filename: if disable filename header for preview page, default: 0
-- vim.g.mkdp_preview_options = {
-- mkit = {},
-- katex = {},
-- uml = {},
-- maid = {},
-- disable_sync_scroll = 0,
-- sync_scroll_type = "middle",
-- hide_yaml_meta = 1,
-- sequence_diagrams = {},
-- flowchart_diagrams = {},
-- content_editable = {v = false},
-- disable_filename = 0
-- }

-- use a custom markdown style must be absolute path
-- like '/Users/username/markdown.css' or expand('~/markdown.css')
-- vim.g.mkdp_markdown_css = ""

-- use a custom highlight style must absolute path
-- like '/Users/username/highlight.css' or expand('~/highlight.css')
-- vim.g.mkdp_highlight_css = ""

-- recognized filetypes
-- these filetypes will have MarkdownPreview... commands
-- vim.g.mkdp_filetypes = {"markdown"}
