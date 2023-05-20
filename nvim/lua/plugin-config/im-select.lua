local status, im_select = pcall(require, "im_select")
if not status then
    vim.notify("im-select not found")
    return
end

im_select.setup({
    -- IM will be set to `default_im_select` in `normal` mode
	-- For Windows/WSL, default: "1033", aka: English US Keyboard
	-- For macOS, default: "com.apple.keylayout.ABC", aka: US
	-- For Linux, default: "keyboard-us"
	-- You can use `im-select` or `fcitx5-remote -n` to get the IM's name you preferred
	default_im_select  = "com.apple.keylayout.ABC",

	-- Can be binary's name or binary's full path,
	-- e.g. 'im-select' or '/usr/local/bin/im-select'
	-- For Windows/WSL, default: "im-select.exe"
	-- For macOS, default: "im-select"
	-- For Linux, default: "fcitx5-remote"
	default_command = "im-select",
	
	-- Restore the previous used input method state when the following events are triggered
    -- if you don't want to restore previous used im in Insert mode,
    -- e.g. deprecated `disable_auto_restore = 1`, just let it empty `set_previous_events = {}`
    set_previous_events = {},
})
