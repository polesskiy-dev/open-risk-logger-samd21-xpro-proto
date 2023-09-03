![CI Status](https://github.com/polesskiy-dev/open-risk-logger-samd21-xpro-proto/actions/workflows/ci.yml/badge.svg?branch=main)
[![Documentation](https://img.shields.io/badge/docs-Doxygen-blue.svg)](https://polesskiy-dev.github.io/open-risk-logger-samd21-xpro-proto/)
# Open Risk Logger proto
### Based on Microchip SAMD21 chip, [ATSAMD21-XPRO dev board](https://www.microchip.com/en-us/development-tool/ATSAMD21-XPRO)

## Documentation
[Doxygen project documentation](https://polesskiy-dev.github.io/open-risk-logger-samd21-xpro-proto/files.html), modern css theme by [doxygen-awesome-css](https://github.com/jothepro/doxygen-awesome-css). Deployed on GitHub pages by GitHub actions. 

## Initialization
```
$ git submodule init && git submodule update --remote # install submodules
```

## Libraries
`libraries` are managing by [Git submodules feature](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
add example: `git submodule add https://github.com/polesskiy-dev/active-object-fsm.git libraries/active-object-fsm`

## Debug
Inside `__DEBUG` should be placed debug related functionality i.e. `SYS_DEBUG_PRINT(SYS_ERROR_INFO, fmt, ...)`

To open terminal you can use i.e. `minicom`:
```
minicom --device /dev/tty.usbmodem1234567890121 --baudrate 115200
```

## Unit tests [WIP]
[UNIT TESTING FOR C](http://www.throwtheswitch.org/unity)

## Side notes

### Naming conventions

- file names
    - snake_case
- variables
    - Module_camelCase for module global variables
    - camelCase for local variables
- functions
    - Module_PascalCase for module public functions
    - MODULE_PascalCase from Harmony libraries
    - _camelCase for module private functions
- types
    - UPPER_CASE_T for macros types
    - UPPER_CASE for #define or constants
    - UPPER_CASE for enums
    - TPascalCase for typedef struct
    - PascalCase for struct