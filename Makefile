all: prepare-env build-sbsigntools build-efitools rpm-sbsigntools rpm-efitools release

prepare-env:
    dnf update -y
    dnf install -y wget gcc automake binutils-devel openssl openssl-devel libuuid-devel gnu-efi-devel help2man perl-File-Slurp rpm-build rpmdevtools
    wget https://github.com/freshautomations/stemplate/releases/download/v0.3.0/stemplate_linux_amd64 -O /usr/local/bin/stemplate
    chmod +x /usr/local/bin/stemplate

build-sbsigntools:
    git clone https://github.com/.../sbsigntools.git
    cd sbsigntools
    make

build-efitools:
    git clone https://github.com/.../efitools.git
    cd efitools
    make

rpm-sbsigntools:
    rpmdev-setuptree
    name=sbsigntools-${VERSION} stemplate rpmmacros -o ${HOME}/.rpmmacros --string name
    mkdir "${HOME}"/rpmbuild/SOURCES/sbsigntools
    cd sbsigntools/src && cp sbattach sbkeysync sbsiglist sbsign sbvarsign sbverify "${HOME}/rpmbuild/SOURCES/sbsigntools"
    cd sbsigntools/docs && cp sbattach.1 sbsiglist.1 sbsign.1 sbvarsign.1 sbverify.1 "${HOME}"/rpmbuild/SOURCES/sbsigntools
    cd sbsigntools && cp COPYING "${HOME}/rpmbuild/SOURCES/sbsigntools"
    tar -czf "${HOME}"/rpmbuild/SOURCES/sbsigntools-${VERSION}.tar.gz -C "${HOME}"/rpmbuild/SOURCES sbsigntools
    VERSION=`cat sbsigntools/sbsigntools-version` stemplate sbsigntools.spec -o "${HOME}"/rpmbuild/SPECS --string VERSION
    cd "${HOME}"/rpmbuild && rpmbuild -ba SPECS/sbsigntools.spec

rpm-efitools:
    rpmdev-setuptree
    name=efitools-${VERSION} stemplate rpmmacros -o ${HOME}/.rpmmacros --string name
    mkdir "${HOME}"/rpmbuild/SOURCES/efitools
    cd efitools && cp HashTool.efi HelloWorld.efi KeyTool.efi Loader.efi LockDown.efi ReadVars.efi SetNull.efi ShimReplace.efi UpdateVars.efi COPYING README cert-to-efi-hash-list cert-to-efi-hash-list.txt efi-tools.spec -O "${HOME}"/rpmbuild/SOURCES/efitools
    tar -czf "${HOME}"/rpmbuild/SOURCES/efitools-${VERSION}.tar.gz -C "${HOME}"/rpmbuild/SOURCES efitools
    VERSION=`cat efitools/efitools-version` stemplate efitools.spec -o "${HOME}"/rpmbuild/SPECS --string VERSION
    cd "${HOME}"/rpmbuild && rpmbuild -ba SPECS/efitools.spec

release:
    bash .circleci/release.bash ${HOME}/rpmbuild/RPMS/x86_64/sbsigntools-${VERSION}-1.x86_64.rpm ${HOME}/rpmbuild/RPMS/x86_64/efitools-${VERSION}-1.x86_64.rpm

clean:
    rm -rf efitools sbsigntools ${HOME}/rpmbuild
