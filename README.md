# JuliaDot

[![Build Status](https://travis-ci.com/okamumu/JuliaDot.jl.svg?branch=master)](https://travis-ci.com/okamumu/JuliaDot.jl)
[![Coverage](https://codecov.io/gh/okamumu/JuliaDot.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/okamumu/JuliaDot.jl)
[![Coverage](https://coveralls.io/repos/github/okamumu/JuliaDot.jl/badge.svg?branch=master)](https://coveralls.io/github/okamumu/JuliaDot.jl?branch=master)

This package proveds the function to draw the graph with DOT (graphviz).

## Installation

This is not in the official package of Julia yet. Please run the following command to install it.

```julia
using Pkg
Pkg.add(PackageSpec(url="https://github.com/JuliaReliab/JuliaDot.jl.git"))
```

Also the package requires Graphviz to draw the diagram. In the case of Ubuntu, please install the graphviz package as follows in the terminal.
```sh
apt updata
apt install graphviz
```

When the tool cannot find the graphivz dot even though it has been installed, please set the environemnt:
```julia
JuliaDotENV["PATH"] = "/path/to/dot"
```

## Usage

The function `draw` create the PNG file from a given DOT language
```
result = draw("""
digraph G {
  a -> b
}
""")
```
This can be written in the file:
```
write("output.png", result)
```

The function `drawfile` can directly read the DOT file.
