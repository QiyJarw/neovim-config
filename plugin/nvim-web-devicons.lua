local status, nvimWebDevicons = pcall(require, "nvim-web-devicons")
if ( not status ) then return end

nvimWebDevicons.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
nvimWebDevicons.get_icons()
