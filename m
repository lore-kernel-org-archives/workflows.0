Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84B4749EE;
	Fri, 14 Aug 2026 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718110; cv=none; b=sFQo87JhnW6Cd2NIkw8edF5WKqemo46D+XMxinIISD3O/m7diGe9dsutbYoXU2iPpmMWxnk8X3G9bV91wSDdzmo6ELllSSDS65xVRmqx7pFDYWlabD4916bIIEPZhSnWQ4mnrkQmIzBU7V7Hx8CFEW1KkT16SreJvRIZIKMH63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718110; c=relaxed/simple;
	bh=Z83q3XkKSTgAZcDEOrbNxnhjGXV38OlQmyKxFrru2ts=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dErEHddQf/68bU9ck1c+QqQW6PXDOEBXuicc3tuFzuo55NrBwRP/vPtpxBhOpsS2Q6s05BFYclme5VtEIIjJlM4EgGrsl0JRVGHKbQEP9TKAAaOS4VRl3jMlWEniORU6N8AotadJ/J2r5F5AzEIGhEcUmzHLgjTEWAoHZ5qIH0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PLOWa4jF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m5rZ28Ot; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PLOWa4jF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m5rZ28Ot"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hM4WP4gqXzMlD5;
	Fri, 14 Aug 2026 16:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786718097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BwZKbNT4VhMtHNxOa3Rl8Ef2UbXi4EY4rnCMNfExzKc=;
	b=PLOWa4jFrjjPgp+8o91sY6ADed7lMXzRw3nAV+9HvfaiFXhT9N3vWftLT60Fw4nl/RNq16
	aRF9LHcEKQr6+YgC8iXVnV671w/cdlHnDqI0vOPfYHhSmns3xSRISMq3iXvFD3wkoSWfq9
	y5lzwSRQh81QXuBP9V+UKyY5Hg/xogyW5OvyhIqQ5TQS4POm4JAIvZuH9JZAHO1AzCRyZC
	3KrMoEZjWVN6XkjdTYxJ6MrvazZ3GssITSSeB5spgcYpwFX9fru651xPCMgiCPk4UBX3TS
	DMM5/gmojKW1TpFvDY4gT0cGfWO292ci/9kOTzzOC7tSozc0BwoaEPJSdIa+sQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m5rZ28Ot;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786718096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BwZKbNT4VhMtHNxOa3Rl8Ef2UbXi4EY4rnCMNfExzKc=;
	b=m5rZ28OtdDZjg4KnLQhw2YT/Wa214mB0hpquTj9r9zAowzyf4k5uxXhnq43GaKOS5woF3T
	j7melMOHAC0/uZeYWNn2bleLqdtwEs/3jsELibkyapY900VL40FFQGi2FgjSvCzbaVHNL9
	RjqXaiXstVdbzdpmqO+/8ROSGn4JkRfgbG3K0GXCCTaHaSm9si8dmptkWBsoglFMl0AqLa
	GydvpOqEioxV6KtKpMUjHuPg10ffryKz5DFwF+0k0txUom7n88Pxoeudt1avx/LxZ1fVRE
	nBynhTdiXVN4iBZ0qza2hCwL1vhTrNP89qdqL+n/tEGSLLwMkq1GqNdyqaBTZA==
To: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list),
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] ver_linux: add comparison with required version and add rows and colour to output
Date: Fri, 14 Aug 2026 16:32:13 +0200
Message-ID: <20260814143212.2288631-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 33iroxeczcti3yg38dec1s7arq18r3ij
X-MBO-RS-ID: 01cd7eb93dd8d1d4a11
X-Rspamd-Queue-Id: 4hM4WP4gqXzMlD5

Add the required version from changes.rst.
Add code for comparison and print '###' in the respective row (good, bad) and in
the respective colour (blue, green, red) depending on the result of the comparison.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v2]
add colour reset as Geert suggested
change output to take colourblindness into account
---
 scripts/ver_linux | 112 ++++++++++++++++++++++++++--------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 00bdaf30d590..5488e3d83a4f 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -8,6 +8,9 @@
 BEGIN {
 	usage = "If some fields are empty or look unusual you may have an old version.\n"
 	usage = usage "Compare to the current minimal requirements in Documentation/process/changes.rst\n"
+	usage = usage "\033[34m BLUE \033[0mmeans there is no required version available,\n"
+	usage = usage "\033[32m GREEN \033[0mmeans the version on your machine is above the requirement,\n"
+	usage = usage "\033[31m RED \033[0mmeans the version on your machine is below the requirement, please update and run again.\n\033[0m"
 	print usage
 
 	system("uname -a")
@@ -17,58 +20,61 @@ BEGIN {
 	libc = "libc[.]so[.][0-9]+$"
 	libcpp = "(libg|stdc)[+]+[.]so([.][0-9]+)+$"
 
-	printversion("bash", version("bash --version"))
-	printversion("bc", version("bc --version"))
-	printversion("bindgen", version("bindgen --version"))
-	printversion("binutils", version("ld -v"))
-	printversion("bison", version("bison --version"))
-	printversion("btrfs-progs", version("btrfs --version"))
-	printversion("Clang", version("clang --version"))
-	printversion("Console-tools", version("loadkeys -V"))
-	printversion("Dynamic linker (ldd)", version("ldd --version"))
-	printversion("e2fsprogs", version("e2fsck -V"))
-	printversion("flex", version("flex --version"))
-	printversion("gdb", version("gdb -version"))
-	printversion("GNU awk", version("gawk --version"))
-	printversion("GNU C", version("gcc -dumpversion"))
-	printversion("GNU make", version("make --version"))
-	printversion("GNU tar", version("tar --version"))
-	printversion("GRUB2", version("grub2-install --version"))
-	printversion("GRUB", version("grub-install --version"))
-	printversion("gtags", version("gtags --version"))
-	printversion("iptables", version("iptables -V"))
-	printversion("Isdn4k-utils", version("isdnctrl"))
-	printversion("jfsutils", version("fsck.jfs -V"))
-	printversion("Kbd", version("loadkeys -V"))
-	printversion("kmod", version("kmod -V"))
+	printf("toolname\t\tcurrent\trequired\tstatus \n")
+	printf("\t\t\tversion\tversion\t\tgood    bad\n")
+
+	printversion("bash", version("bash --version"), "4.2")
+	printversion("bc", version("bc --version"), "1.06.95")
+	printversion("bindgen", version("bindgen --version"), "0.71.1")
+	printversion("binutils", version("ld -v"), "2.30")
+	printversion("bison", version("bison --version"), "2.0")
+	printversion("btrfs-progs", version("btrfs --version"), "0.18")
+	printversion("Clang", version("clang --version"), "17.0.1")
+	printversion("Console-tools", version("loadkeys -V"), "")
+	printversion("Dynamic linker (ldd)", version("ldd --version"), "")
+	printversion("e2fsprogs", version("e2fsck -V"), "1.41.4")
+	printversion("flex", version("flex --version"), "2.5.35")
+	printversion("gdb", version("gdb -version"), "7.2")
+	printversion("GNU awk", version("gawk --version"), "5.1.0")
+	printversion("GNU C", version("gcc -dumpversion"), "8.1")
+	printversion("GNU make", version("make --version"), "4.0")
+	printversion("GNU tar", version("tar --version"), "1.28")
+	printversion("GRUB2", version("grub2-install --version"), "0.93")
+	printversion("GRUB", version("grub-install --version"), "0.93")
+	printversion("gtags", version("gtags --version"), "6.6.5")
+	printversion("iptables", version("iptables -V"), "1.4.2")
+	printversion("Isdn4k-utils", version("isdnctrl"), "")
+	printversion("jfsutils", version("fsck.jfs -V"), "1.1.3")
+	printversion("Kbd", version("loadkeys -V"), "")
+	printversion("kmod", version("kmod -V"), "13")
 
 	while ("ldconfig -p 2>/dev/null" | getline > 0)
 		if ($NF ~ libc || $NF ~ libcpp)
 			if (!seen[ver = version("readlink " $NF)]++)
 				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
 
-	printversion("mcelog", version("mcelog --version"))
-	printversion("mkimage", version("mkimage --version"))
-	printversion("Module-init-tools", version("depmod -V"))
-	printversion("Mount", version("mount --version"))
-	printversion("Net-tools", version("ifconfig --version"))
-	printversion("nfs-utils", version("showmount --version"))
-	printversion("openssl", version("openssl version"))
-	printversion("pahole", version("pahole --version"))
-	printversion("Pcmcia-cs", version("cardmgr -V"))
-	printversion("pcmciautils", version("pccardctl -V"))
-	printversion("PPP", version("pppd --version"))
-	printversion("procps", version("ps --version"))
-	printversion("Python", version("python3 -V"))
-	printversion("quota-tools", version("quota -V"))
-	printversion("Rust", version("rustc --version"))
-	printversion("Sh-utils", version("expr --v"))
-	printversion("Sphinx", version("sphinx-build --version"))
-	printversion("squashfs-tools", version("mksquashfs -version"))
-	printversion("udev", version("udevadm --version"))
-	printversion("util-linux", version("mount --version"))
-	printversion("Wireless-tools", version("iwconfig --version"))
-	printversion("xfsprogs", version("xfs_db -V"))
+	printversion("mcelog", version("mcelog --version"), "0.6 ")
+	printversion("mkimage", version("mkimage --version"), "2017.01")
+	printversion("Module-init-tools", version("depmod -V"), "")
+	printversion("Mount", version("mount --version"), "")
+	printversion("Net-tools", version("ifconfig --version"), "")
+	printversion("nfs-utils", version("showmount --version"), "1.0.5")
+	printversion("openssl", version("openssl version"), "1.0.0")
+	printversion("pahole", version("pahole --version"), "1.26")
+	printversion("Pcmcia-cs", version("cardmgr -V"), "")
+	printversion("pcmciautils", version("pccardctl -V"), "004")
+	printversion("PPP", version("pppd --version"), "2.4.0")
+	printversion("procps", version("ps --version"), "3.2.0")
+	printversion("Python", version("python3 -V"), "3.9.0")
+	printversion("quota-tools", version("quota -V"), "3.09")
+	printversion("Rust", version("rustc --version"), "1.85.0")
+	printversion("Sh-utils", version("expr --v"), "")
+	printversion("Sphinx", version("sphinx-build --version"), "3.4.3")
+	printversion("squashfs-tools", version("mksquashfs -version"), "4.0")
+	printversion("udev", version("udevadm --version"), "081")
+	printversion("util-linux", version("mount --version"), "2.10o")
+	printversion("Wireless-tools", version("iwconfig --version"), "")
+	printversion("xfsprogs", version("xfs_db -V"), "2.6.0")
 
 	while ("sort /proc/modules" | getline > 0) {
 		mods = mods sep $1
@@ -89,9 +95,17 @@ function version(cmd,    ver) {
 	return ver
 }
 
-function printversion(name, value,  ofmt) {
-	if (value != "") {
+function printversion(name, cur_version, req_version,  ofmt) {
+	if (req_version == "") {
+		ofmt = "%-20s\t%s\n"
+		printf(ofmt, name,  cur_version"\t"req_version"\t\t\033[34m###\033[0m")
+	}
+	else if (cur_version >= req_version) {
+		ofmt = "%-20s\t%s\n"
+		printf(ofmt, name,  cur_version"\t"req_version"\t\t\033[32m###\033[0m")
+	}
+	else {
 		ofmt = "%-20s\t%s\n"
-		printf(ofmt, name, value)
+		printf(ofmt, name,  cur_version"\t"req_version"\t\t\t\033[31m###\033[0m")
 	}
 }
-- 
2.54.0

