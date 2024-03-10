--[[

linecount.lua
=============================================================================

A Pandoc Lua filter designed to count the non-empty lines in the document body, excluding YAML frontmatter and blank lines. This filter is useful for poems formatted in Standard Manuscript Format, where the total number of lines should be shown.

See also: Word Count https://pandoc.org/lua-filters.html#counting-words-in-a-document

Usage
--------------------------------------------------------------------------------

pandoc --lua-filter=linecount.lua --pdf-engine=lualatex --template=poem.latex example.md --output=output.pdf

Note: Ensure that your document template (`poem.latex`) includes a variable to display the line count in the document header. For example, add `$linecount$` in your template where you want the line count to appear.

Default Locations for Lua Filters

Pandoc's Lua filters directory is specified by the `pandoc --data-dir` command.
https://pandoc.org/MANUAL.html#option--data-dir
Ensure that 'linecount.lua' is placed (or symlinked) in one of these default locations, or specify the full path to the filter in the command if stored elsewhere.

By default, the path is often:
(Windows) `%APPDATA%\pandoc`
Mac/Unix: `$HOME/.local/share/pandoc`.

]]--

LineCount = 0

function countLines(block)
  if block.t == "Para" then
    -- Count non-empty lines in paragraphs
    local text = pandoc.utils.stringify(block)
    if text:match("%S") then -- If the line has non-space characters
      LineCount = LineCount + 1
    end
  elseif block.t == "LineBlock" then
    -- Directly count lines in a LineBlock, excluding empty lines
    for _, line in ipairs(block.content) do
      if #line > 0 then
        LineCount = LineCount + 1
      end
    end
  end
end

function Pandoc(doc)
  -- Walk the document and count lines, excluding blank lines
  pandoc.walk_block(pandoc.Div(doc.blocks), {
    Para = countLines,
    LineBlock = countLines,
  })
  -- Insert the line count into the document's metadata
  doc.meta['linecount'] = pandoc.MetaString(tostring(LineCount))
  return doc
end
