#include <map>
#include "test_macros.h"

#if TEST_STD_VER < 14

# ifdef __cpp_lib_allocator_traits_is_always_equal
#   error "__cpp_lib_allocator_traits_is_always_equal should not be defined before c++17"
# endif

# ifdef __cpp_lib_erase_if
#   error "__cpp_lib_erase_if should not be defined before c++2a"
# endif

# ifdef __cpp_lib_generic_associative_lookup
#   error "__cpp_lib_generic_associative_lookup should not be defined before c++14"
# endif

# ifdef __cpp_lib_map_try_emplace
#   error "__cpp_lib_map_try_emplace should not be defined before c++17"
# endif

# ifdef __cpp_lib_node_extract
#   error "__cpp_lib_node_extract should not be defined before c++17"
# endif

# ifdef __cpp_lib_nonmember_container_access
#   error "__cpp_lib_nonmember_container_access should not be defined before c++17"
# endif

#elif TEST_STD_VER == 14

# ifdef __cpp_lib_allocator_traits_is_always_equal
#   error "__cpp_lib_allocator_traits_is_always_equal should not be defined before c++17"
# endif

# ifdef __cpp_lib_erase_if
#   error "__cpp_lib_erase_if should not be defined before c++2a"
# endif

# ifndef __cpp_lib_generic_associative_lookup
#   error "__cpp_lib_generic_associative_lookup should be defined in c++14"
# endif
# if __cpp_lib_generic_associative_lookup != 201304L
#   error "__cpp_lib_generic_associative_lookup should have the value 201304L in c++14"
# endif

# ifdef __cpp_lib_map_try_emplace
#   error "__cpp_lib_map_try_emplace should not be defined before c++17"
# endif

# ifdef __cpp_lib_node_extract
#   error "__cpp_lib_node_extract should not be defined before c++17"
# endif

# ifdef __cpp_lib_nonmember_container_access
#   error "__cpp_lib_nonmember_container_access should not be defined before c++17"
# endif

#elif TEST_STD_VER == 17

# ifndef __cpp_lib_allocator_traits_is_always_equal
#   error "__cpp_lib_allocator_traits_is_always_equal should be defined in c++17"
# endif
# if __cpp_lib_allocator_traits_is_always_equal != 201411L
#   error "__cpp_lib_allocator_traits_is_always_equal should have the value 201411L in c++17"
# endif

# ifdef __cpp_lib_erase_if
#   error "__cpp_lib_erase_if should not be defined before c++2a"
# endif

# ifndef __cpp_lib_generic_associative_lookup
#   error "__cpp_lib_generic_associative_lookup should be defined in c++17"
# endif
# if __cpp_lib_generic_associative_lookup != 201304L
#   error "__cpp_lib_generic_associative_lookup should have the value 201304L in c++17"
# endif

# ifndef __cpp_lib_map_try_emplace
#   error "__cpp_lib_map_try_emplace should be defined in c++17"
# endif
# if __cpp_lib_map_try_emplace != 201411L
#   error "__cpp_lib_map_try_emplace should have the value 201411L in c++17"
# endif

# ifndef __cpp_lib_node_extract
#   error "__cpp_lib_node_extract should be defined in c++17"
# endif
# if __cpp_lib_node_extract != 201606L
#   error "__cpp_lib_node_extract should have the value 201606L in c++17"
# endif

# ifndef __cpp_lib_nonmember_container_access
#   error "__cpp_lib_nonmember_container_access should be defined in c++17"
# endif
# if __cpp_lib_nonmember_container_access != 201411L
#   error "__cpp_lib_nonmember_container_access should have the value 201411L in c++17"
# endif

#elif TEST_STD_VER > 17