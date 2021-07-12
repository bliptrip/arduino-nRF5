/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x18000, LENGTH = 0x23800
  NVM (rw)   : ORIGIN = 0x3B800, LENGTH = 0x4800
  RAM (rwx)  : ORIGIN = 0x20002000, LENGTH = 0x2000
}

SECTIONS
{
  .fs_data_out ALIGN(4):
  {
    PROVIDE( __start_fs_data = .);
    KEEP(*(fs_data))
    PROVIDE( __stop_fs_data = .);
  } = 0
}

SECTIONS
{
    .lfs_data ALIGN(1024):
    {
        __start_lfs_data   = .;
        __length_lfs_data  = 0x4800;
        __end_lfs_data     = __start_lfs_data + 0x4800;
    } > NVM
}



INCLUDE "nrf5x_common.ld"
