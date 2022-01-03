local ok, gitsign = pcall(require, "gitsigns")
if not ok then
    print "Plugin gitsign not found"
    return
end

gitsign.setup()
