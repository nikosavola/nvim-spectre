-- vim: ft=lua

std = 'luajit'

-- Neovim globals
globals = {
    'vim',
}

read_globals = {
    '_G',
}

-- Don't warn about unused self parameters in methods
self = false

-- Max line length
max_line_length = 120

-- Ignore generated files
exclude_files = {
    'spectre_oxi/',
}

-- Files to check
files['lua/'] = {
    globals = {},
}

files['tests/'] = {
    -- Test globals from plenary busted
    globals = {
        'describe',
        'it',
        'before_each',
        'after_each',
        'assert',
        'pending',
    },
}

files['plugin/'] = {
    globals = {},
}

-- Ignore some common warnings
ignore = {
    '212', -- Unused argument (common in callbacks)
}
