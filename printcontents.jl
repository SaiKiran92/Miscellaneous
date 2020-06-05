function printcontents(io::IOStream, folderpath::String, mask::Function=x -> true, numspaces::Int=0)
    contents = sort(readdir(folderpath), by=(i) -> isdir(folderpath * i))
    filter!(mask, contents)
    for f in contents
        println(io, '\t'^numspaces * f)
        if isdir(folderpath * f)
            printcontents(io, folderpath * f * "\\", numspaces + 1)
        end
    end
end
printcontents(folderpath::String, mask::Function, numspaces::Int=0) = printcontents(stdout, folderpath, mask, numspaces)

# Usage example
open("contents.txt", "w") do io
    printcontents(io, "PhD\\", i -> i ≠ ".ipynb_checkpoints")
end
