module SeisAcoustic

    # the dependency of this module
    using LinearAlgebra,
          Printf,           # formated print
          DelimitedFiles,   # delimited text file
          SparseArrays,     # finite-difference sparse matrix
          DSP,              # smoothing and convolution
          FFTW,             # fourier transform
          OffsetArrays,     # User-defined index range (similar to fortran)
          Distributed       # distribute parallel computing

    # the path to the binary dependency (sparse matrix multiplication)
    const spmatveclib  = abspath(joinpath(splitdir(Base.source_path())[1],"..","deps","builds","spmatvec.so"))

    # overloading Base function
    import Base.convert, Base.show, Base.isequal, Base.zeros

    include("dataio/dataio.jl")          # read and write segy data, internally defined regular sampled data (borrow from rsf)
    include("finitediff/finitediff.jl")  # finite-difference method for acoustic wave equation
    include("imaging/imaging.jl")
    include("fwi/fwi.jl")
    include("solver/solver.jl")

end # module
