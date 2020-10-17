public
enum GL
{
    // note: GL.Int is Swift.Int32, not Swift.Int, and
    //       GL.UInt is Swift.UInt32, not Swift.UInt
    public typealias Bool           = Swift.Bool
    public typealias Double         = Swift.Double
    public typealias ClampDouble    = Swift.Double
    public typealias Float          = Swift.Float
    public typealias ClampFloat     = Swift.Float
    public typealias Byte           = Swift.Int8
    public typealias Char           = Swift.Int8
    public typealias CharARB        = Swift.Int8
    public typealias Short          = Swift.Int16
    public typealias Int            = Swift.Int32
    public typealias Size           = Swift.Int32
    public typealias Enum           = Swift.Int32
    public typealias Fixed          = Swift.Int32
    public typealias ClampX         = Swift.Int32
    public typealias Int64          = Swift.Int64
    public typealias Int64EXT       = Swift.Int64
    public typealias IntPointer     = Swift.Int
    public typealias IntPointerARB  = Swift.Int
    public typealias SizePointer    = Swift.Int
    public typealias SizePointerARB = Swift.Int
    public typealias VdpauSurfaceNV = Swift.Int
    public typealias UByte          = Swift.UInt8
    public typealias UShort         = Swift.UInt16
    public typealias HalfNV         = Swift.UInt16
    public typealias UInt           = Swift.UInt32
    public typealias Bitfield       = Swift.UInt32
    public typealias UInt64         = Swift.UInt64
    public typealias UInt64EXT      = Swift.UInt64
    public typealias HandleARB      = UnsafeMutableRawPointer?
    public typealias EGLImageOES    = UnsafeMutableRawPointer?
    public typealias Sync           = OpaquePointer?

    public typealias DebugProc = @convention(c)
        (Swift.Int32, Swift.Int32, Swift.UInt32, Swift.Int32, Swift.Int32, UnsafePointer<Swift.Int8>?, UnsafeRawPointer?) -> ()
    public typealias DebugProcARB = DebugProc
    public typealias DebugProcKHR = DebugProc

    public typealias DebugProcAMD = @convention(c)
        (Swift.Int32, Swift.Int32, Swift.Int32, Swift.Int32, UnsafePointer<Swift.Int8>?, UnsafeMutableRawPointer?) -> ()

    public static 
    let CURRENT_BIT:Swift.UInt32 = 0x00000001, 
        POINT_BIT:Swift.UInt32 = 0x00000002, 
        LINE_BIT:Swift.UInt32 = 0x00000004, 
        POLYGON_BIT:Swift.UInt32 = 0x00000008, 
        POLYGON_STIPPLE_BIT:Swift.UInt32 = 0x00000010, 
        PIXEL_MODE_BIT:Swift.UInt32 = 0x00000020, 
        LIGHTING_BIT:Swift.UInt32 = 0x00000040, 
        FOG_BIT:Swift.UInt32 = 0x00000080, 
        DEPTH_BUFFER_BIT:Swift.UInt32 = 0x00000100, 
        ACCUM_BUFFER_BIT:Swift.UInt32 = 0x00000200, 
        STENCIL_BUFFER_BIT:Swift.UInt32 = 0x00000400, 
        VIEWPORT_BIT:Swift.UInt32 = 0x00000800, 
        TRANSFORM_BIT:Swift.UInt32 = 0x00001000, 
        ENABLE_BIT:Swift.UInt32 = 0x00002000, 
        COLOR_BUFFER_BIT:Swift.UInt32 = 0x00004000, 
        HINT_BIT:Swift.UInt32 = 0x00008000, 
        EVAL_BIT:Swift.UInt32 = 0x00010000, 
        LIST_BIT:Swift.UInt32 = 0x00020000, 
        TEXTURE_BIT:Swift.UInt32 = 0x00040000, 
        SCISSOR_BIT:Swift.UInt32 = 0x00080000, 
        MULTISAMPLE_BIT:Swift.UInt32 = 0x20000000, 
        MULTISAMPLE_BIT_ARB:Swift.UInt32 = 0x20000000, 
        MULTISAMPLE_BIT_EXT:Swift.UInt32 = 0x20000000, 
        MULTISAMPLE_BIT_3DFX:Swift.UInt32 = 0x20000000, 
        ALL_ATTRIB_BITS:Swift.UInt32 = 0xFFFFFFFF, 
        COVERAGE_BUFFER_BIT_NV:Swift.UInt32 = 0x00008000, 
        CLIENT_PIXEL_STORE_BIT:Swift.UInt32 = 0x00000001, 
        CLIENT_VERTEX_ARRAY_BIT:Swift.UInt32 = 0x00000002, 
        CLIENT_ALL_ATTRIB_BITS:Swift.UInt32 = 0xFFFFFFFF, 
        CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT:Swift.UInt32 = 0x00000001, 
        CONTEXT_FLAG_DEBUG_BIT:Swift.UInt32 = 0x00000002, 
        CONTEXT_FLAG_DEBUG_BIT_KHR:Swift.UInt32 = 0x00000002, 
        CONTEXT_FLAG_ROBUST_ACCESS_BIT:Swift.UInt32 = 0x00000004, 
        CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB:Swift.UInt32 = 0x00000004, 
        CONTEXT_FLAG_NO_ERROR_BIT_KHR:Swift.UInt32 = 0x00000008, 
        CONTEXT_CORE_PROFILE_BIT:Swift.UInt32 = 0x00000001, 
        CONTEXT_COMPATIBILITY_PROFILE_BIT:Swift.UInt32 = 0x00000002, 
        MAP_READ_BIT:Swift.UInt32 = 0x0001, 
        MAP_READ_BIT_EXT:Swift.UInt32 = 0x0001, 
        MAP_WRITE_BIT:Swift.UInt32 = 0x0002, 
        MAP_WRITE_BIT_EXT:Swift.UInt32 = 0x0002, 
        MAP_INVALIDATE_RANGE_BIT:Swift.UInt32 = 0x0004, 
        MAP_INVALIDATE_RANGE_BIT_EXT:Swift.UInt32 = 0x0004, 
        MAP_INVALIDATE_BUFFER_BIT:Swift.UInt32 = 0x0008, 
        MAP_INVALIDATE_BUFFER_BIT_EXT:Swift.UInt32 = 0x0008, 
        MAP_FLUSH_EXPLICIT_BIT:Swift.UInt32 = 0x0010, 
        MAP_FLUSH_EXPLICIT_BIT_EXT:Swift.UInt32 = 0x0010, 
        MAP_UNSYNCHRONIZED_BIT:Swift.UInt32 = 0x0020, 
        MAP_UNSYNCHRONIZED_BIT_EXT:Swift.UInt32 = 0x0020, 
        MAP_PERSISTENT_BIT:Swift.UInt32 = 0x0040, 
        MAP_PERSISTENT_BIT_EXT:Swift.UInt32 = 0x0040, 
        MAP_COHERENT_BIT:Swift.UInt32 = 0x0080, 
        MAP_COHERENT_BIT_EXT:Swift.UInt32 = 0x0080, 
        DYNAMIC_STORAGE_BIT:Swift.UInt32 = 0x0100