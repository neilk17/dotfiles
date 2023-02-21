local ok, indentscope = pcall(require, "mini.indentscope")
if not ok then
    return
end

indentscope.setup {
    symbol = '│',
}

