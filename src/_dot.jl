
export draw
export drawfile
export JuliaDotENV

const JuliaDotENV = Dict(
    "PATH" => "dot"
)

struct DrawResult
    content
end

function Base.show(io::IO, ::MIME"image/png", c::DrawResult)
    write(io, c.content)
end

function Base.write(io::IO, c::DrawResult)
    write(io, c.content)
end

function draw(data)
    file = tempname(cleanup=false)
    open(`$(JuliaDotENV["PATH"]) -Tpng -o $file`, "w", stdout) do io
        write(io, data)
    end
    img = Vector{UInt8}(undef,0)
    try
        open(file) do io
            while !eof(io)
                push!(img, read(io, UInt8))
            end
        end
    catch
        throw(ErrorException("Cannot read PNG file."))
    finally
        rm(file)
    end
    DrawResult(img)
end

function drawfile(file)
    data = open(file) do io
        read(io, String)
    end
    draw(data)
end
