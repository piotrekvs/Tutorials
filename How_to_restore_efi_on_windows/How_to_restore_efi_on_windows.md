# How to restore EFI partition in Windows 10?

When the EFI partition is deleted, you can try to recover EFI partition in Windows 10 by recreating it in Command Prompt. Here are detailed steps:

## 1. Boot your computer using the Windows 10 installation media or Windows 10 recovery disk

On the first screen, press <kbd>SHIFT</kbd> + <kbd>F10</kbd> to enter Command Prompt

## 2. Run the commands below to shrink a partition for unallocated space

```sh
diskpart
list disk
select disk # ( Select the disk where you want to add the EFI system partition.)
list partition
select partition # (Select the partition which you plan to shrink.)
shrink desired=100 (Shrink the selected partition by 100MB.)
```

## 3. Run the following commands to create the EFI system partition with the unallocated space

```sh
create partition efi size=100
format quick fs=fat32
assign letter=S (You may replace “S” with other letters which are not already used.)
exit
```

## 4. Use the command below to copy the boot files from the Windows partition to the EFI system partition and create the BCD store in it

```sh
bcdboot C:\windows /s S: (“C” is the drive letter of the system partition and “S” is the drive letter you assign to the EFI partition.)
exit
```

## 5. Restart your computer

In addition to recreating the EFI system partition when there is no EFI partition in Windows 10, you can also realize partition recovery with the help of a professional tool.
