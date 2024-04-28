# EFI Tools for Enterprise Linux

## Overview

EFI Tools is a collection of applications designed to manage UEFI Secure Boot within Linux environments. It ensures the integrity and security of Linux systems by facilitating UEFI Secure Boot management.

## Problem Description

The current EFI Tools packages are outdated and incompatible with the latest releases of Enterprise Linux distributions. This poses a challenge for users who require efficient management of UEFI Secure Boot on their Enterprise Linux systems.

EFI Tools were not previously packaged for Enterprise Linux, and the available RPM/DEB packages depend on an old OpenSSL version, rendering them incompatible with certain distributions. This further exacerbates the issue, hindering users from effectively managing UEFI Secure Boot on their Enterprise Linux systems.

## Proposed Solution

This repository offers an updated and packaged version of EFI Tools tailored for various Enterprise Linux distributions, including:

- Red Hat Enterprise Linux (RHEL)
- CentOS
- Oracle Linux
- Rocky Linux
- AlmaLinux
- Scientific Linux
- SUSE Linux Enterprise Server (SLES)
- openSUSE Leap

The build process utilizes the latest development version of the Linux Kernel sourced from the official Git repository to construct the sbsigntools and efitools packages.

## Key Features

- Aligned with the latest Enterprise Linux releases
- Includes the most recent sbsigntools and efitools packages
- Simple installation and usage process

## Todo and ToFix

- Adjust the build process to construct the latest tagged release instead of fetching the development version.
- Implement GPG key signing for RPM binaries. (This is in the works.)
- Establish a package repository.

## About

This repository aims to furnish a convenient and up-to-date package of EFI Tools for Enterprise Linux users. Contributions and feedback are encouraged and appreciated!
