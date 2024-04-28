# Overview

EFI Tools is a collection of applications designed to manage UEFI Secure Boot within Linux environments. It ensures the integrity and security of Linux systems by facilitating UEFI Secure Boot management.

## Problem Description

EFI Tools was not packaged for Enterprise Linux. The RPM/DEB packages available depend on an old OpenSSL version, hence they cannot run on newer Enterprise Linux releases.

## Proposed Solution

This repository offers an updated and packaged version of EFI Tools tailored for various Enterprise Linux distributions, including:

- Red Hat Enterprise Linux (RHEL)
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
