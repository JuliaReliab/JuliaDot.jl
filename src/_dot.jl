
export dot

using PyCall
using Conda
Conda.add("python-graphviz", channel="conda-forge")
Conda.add("pydotplus", channel="conda-forge")

const PydotPlus = PyNULL()

function __init__()
    copy!(PydotPlus, pyimport_conda("pydotplus", "pydotplus"))
end

function dot(dot_data)
    graph = PydotPlus.graph_from_dot_data(dot_data)
    graph.progs = Dict("dot" => "$(Conda.BINDIR)/dot")
    Vector{UInt8}(graph.create_png())
    
    # display("image/png", Vector{UInt8}(graph.create_png()))
end

