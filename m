Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4092312803;
	Fri, 14 Aug 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715649; cv=none; b=aZYGRJE6Rj0BY063lUTvu6DnBBBk+msewXTtzw++hlLB3pwr/+9f6l9Uq30HwgWrRtl25wXv45VbJsJ0RZYYF6AiazW5wpjRDmNMCJdEa+/2vdLCkOjqyi85wNvohvGh6Fbt3bt1y6N5wr1tZrRD5LsvamDHemnAudJt8m4RIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715649; c=relaxed/simple;
	bh=2UfRgnUys45ssCBDarzTn1NApgxMqZNCY6B2W38N1r8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f/EMzDGQckLXRCOPAVkIKCC1N76ThT6kEqk+hOPqhWowZWIcRC9ZY+sff+yfzPrPXIIoJ+jcsKgywseBkgCJ8Wdg2lqsEyrBq+KP6DB8hcJRrO4vE2bq3GNBigprk3JTR5+W4ROVb2VntBPiHyF+37SzWhoXMD/a3rSmsi5Ihzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wuysomPN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P0mkU9gS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wuysomPN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="P0mkU9gS"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hM3c44w0fz8txR;
	Fri, 14 Aug 2026 15:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786715636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EpnZWE96eoKdXLQOXgkfZ9OL3A8iyZ9sWSPxu4P0Ymk=;
	b=wuysomPNg9SngRH7yQ+9EN0jb+mD57KZ5TTRtgoE5EOVfOlWl2xXE+fZ1iG92oXGTJQ39b
	UZjNVp3pwTyQWTp9SFmrimmI+N62SfLwXd7wRKqfS4ynT+WHix5IU+SQ3zWoV2uGpi027N
	hEa+amaCDZtlb8FcM1US5N0uTklSvX8oZ9+Oic5MTTvHaibT32ud2JRM00p1KYcxXOXW7T
	Lky3Q+ZBKp+Ad+OMrfve2Ixnm6ny2S0ZqFGLIlcOFBuXbDJ4/bKpmiRqxb22Ce80uzq71w
	1sAUEu5UliWXSH1gRefR4Vh/WIb2HiPFbx8khRLaw3Q4U4FVFKOdhUfunPbgtQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=P0mkU9gS;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786715635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EpnZWE96eoKdXLQOXgkfZ9OL3A8iyZ9sWSPxu4P0Ymk=;
	b=P0mkU9gSZQjDBzqemC1rMkdLG8eRbi0fsMOd38B6XkbqTOkWU9elPVreguZfPCzMx6Kldg
	jJApxszppAW6LKPcD/SkTerI34hsNyMlijvhi4IL6WwdeFO2ZUZpi7+Drv6QED76MEdDf6
	xa+z8NVN60nVIzu+0oK0ZVowypmTYxMgV5SEUAJ6pHNVcQZ0sakHrnp53kPw7+D0MD0SOt
	mFAe9KmNc60LJRFMEgdfkOe21O4iDj9FMWwhQ0czixDyfyHX3f9yj1c6jI6RxnbkXCYHVA
	OHZF/PP9pPTeD2i6ZgisD+/RN6sSMjiRpGVunZzSf9rbIE5Un3EucWPSLowrVQ==
To: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ver_linux: add comparison with required version and colour to output
Date: Fri, 14 Aug 2026 15:49:32 +0200
Message-ID: <20260814134931.2281085-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 33ed4a77f3b5323a42b
X-MBO-RS-META: ae6y4g41kbmuakentnpgd3dp4pgsi7z8
X-Rspamd-Queue-Id: 4hM3c44w0fz8txR

Add the required version from changes.rst.
Add code for comparison and print in colour (blue, green, red) depending
on the result of the comparison.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I had this patch on my mind for more than half a year. I was convinced I
couldn't do it because awk is such a special language. Took me less than
an hour without AI - WTF

Somehow I messed up the formating of the output. I guess it's this lines
+		ofmt = "%-20s\t%s\n"
but I couldn't figure it out :(
---
 scripts/ver_linux | 109 +++++++++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 49 deletions(-)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 00bdaf30d590..27fef46f8763 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -8,6 +8,9 @@
 BEGIN {
 	usage = "If some fields are empty or look unusual you may have an old version.\n"
 	usage = usage "Compare to the current minimal requirements in Documentation/process/changes.rst\n"
+	usage = usage "\033[34m BLUE means there is no required version available,\n"
+	usage = usage "\033[32m GREEN means the version on your machine is above the requirement,\n"
+	usage = usage "\033[31m RED means the version on your machine is below the requirement, please update and run again.\n\033[37m"
 	print usage
 
 	system("uname -a")
@@ -17,58 +20,58 @@ BEGIN {
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
@@ -89,9 +92,17 @@ function version(cmd,    ver) {
 	return ver
 }
 
-function printversion(name, value,  ofmt) {
-	if (value != "") {
+function printversion(name, cur_version, req_version,  ofmt) {
+	if (req_version == "") {
 		ofmt = "%-20s\t%s\n"
-		printf(ofmt, name, value)
+		printf(ofmt, "\033[34m"name,  cur_version)
+	}
+	else if (cur_version >= req_version) {
+		ofmt = "%-20s\t%s\n"
+		printf(ofmt, "\033[32m"name,  cur_version)
+	}
+	else {
+		ofmt = "%-20s\t%s\n"
+		printf(ofmt, "\033[31m"name,  cur_version)
 	}
 }
-- 
2.54.0

