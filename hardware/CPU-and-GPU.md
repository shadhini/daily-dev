# CPU and GPU

`CPU`: general-purpose processor with a few powerful cores optimized for
sequential work, low latency, large caches, and tasks like OS, branching
logic, and single-threaded code.

`GPU`: many simpler cores optimized for massive parallel throughput and high
memory bandwidth; excels at graphics, matrix math, ML, and video processing.

When to use: 
- `CPU` for control, I/O, and branching-heavy code; 
- `GPU` for massively parallel numeric tasks (rendering, neural nets)

Memory: 
- `CPU` uses system RAM/cache
- `GPU` uses VRAM (or unified memory on Apple Silicon)

Programming: 
- `CPU` with normal languages
- `GPU` with shaders/CUDA/Metal/OpenCL

