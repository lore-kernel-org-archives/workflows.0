Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6402C17A0;
	Thu, 26 Feb 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101029; cv=none; b=GagT+rkHrco/EXgVGP1fzXZlF4XhJeq5u+lqfP251hg5DRFZdgX7/mtbRahx+aE5PYlVg33XhReKaUh0KfBu+MV1cgMI/NDgIdJVouGl2QxQXUNDw/nM3+M8JY98NW726rnSRlLe154Vq8iFrWxhrHoXLWYbD/ZIV/J0PtIuQT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101029; c=relaxed/simple;
	bh=t9i23lP6VZ8dPPbQp3CblRq8JE0wSJR/jIG/+ej4P9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJpAbqPpxuPRytshlj+KYNy00XiHssrPeaXHn5VQuPa4IOaye9y3y5DqKqAGYFETXgxOLUtow/z+L7WbGRkV9tMvWdn1Hz0Mhy+mzii0xwYoFbSLW3XqP54wV1jcwdSIIzvTwX5DJ3d8O6knoz6BNa7866D31ug+rUQOjpbl54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=DyhVVhmJ; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="DyhVVhmJ"
From: Hans Anda <hansa@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1772101025; bh=t9i23lP6VZ8dPPbQp3CblRq8JE0wSJR/jIG/+ej4P9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DyhVVhmJgqEXRjsJ8IWlKFkNVOxJL7U8HpDwqlIZ2XXWunhAQFwWKWaMkSq8DuzXr
	 g0fSxHm7pb3ET1XoFBNtUGEheokmSRS2wCntYPwE72Tb+OB0gwB/Y4mxttb22x8bY6
	 oX1WQ23fQNfs3Hl8EcUt3J0nASCT1juqq7PsZyuBXFfrPruk8Od68xB4XA+0STilsC
	 bQw8KUCuqMAvzCYdeViPlJH9GQqa6wdbh2qv/0lEgExJnlC+ImKCL4hk38Ihlc9qUd
	 LphjrV+FSmmLy1Vppy1wI3Pw4alqBZN9W5lq/eB0ZSzkSNNa+f1rLeFncMNQiLJOg7
	 OkR6FMZXAJoxA==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Anda <hansa@airmail.cc>
Subject: [PATCH v2 2/2] scripts: ver_linux: expand and sort
Date: Thu, 26 Feb 2026 11:14:05 +0100
Message-ID: <20260226101404.41639-2-hansa@airmail.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226100256.40215-2-hansa@airmail.cc>
References: <20260226100256.40215-2-hansa@airmail.cc>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing tools in ver_linux
 (bash, bc, bindgen, bindutils, btrfs, clang, e2fsck, grub2, awk, tar,
 gtags, iptables, kmod, mcelog, mkimage, openssl, pahole, python, Rust,
 sphinx, squashfs-tools, udev)
sort output alphabetically
fix path to changes.rst

Signed-off-by: Hans Anda <hansa@airmail.cc>
---
 scripts/ver_linux | 58 +++++++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index d6f2362d3792..51e632adf999 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -7,7 +7,7 @@
 
 BEGIN {
 	usage = "If some fields are empty or look unusual you may have an old version.\n"
-	usage = usage "Compare to the current minimal requirements in Documentation/Changes.\n"
+	usage = usage "Compare to the current minimal requirements in Documentation/process/Changes.rst\n"
 	print usage
 
 	system("uname -a")
@@ -17,37 +17,57 @@ BEGIN {
 	libc = "libc[.]so[.][0-9]+$"
 	libcpp = "(libg|stdc)[+]+[.]so([.][0-9]+)+$"
 
-	printversion("GNU C", version("gcc -dumpversion"))
-	printversion("GNU Make", version("make --version"))
+	printversion("bash", version("bash --version"))
+	printversion("bc", version("bc --version"))
+	printversion("bindgen", version("bindgen --version"))
 	printversion("Binutils", version("ld -v"))
-	printversion("Util-linux", version("mount --version"))
-	printversion("Mount", version("mount --version"))
-	printversion("Module-init-tools", version("depmod -V"))
-	printversion("E2fsprogs", version("tune2fs"))
-	printversion("Jfsutils", version("fsck.jfs -V"))
-	printversion("Xfsprogs", version("xfs_db -V"))
-	printversion("Pcmciautils", version("pccardctl -V"))
-	printversion("Pcmcia-cs", version("cardmgr -V"))
-	printversion("Quota-tools", version("quota -V"))
-	printversion("PPP", version("pppd --version"))
-	printversion("Isdn4k-utils", version("isdnctrl"))
-	printversion("Nfs-utils", version("showmount --version"))
 	printversion("Bison", version("bison --version"))
+	printversion("btrfs-progs", version("btrfs --version"))
+	printversion("Clang", version("clang --version"))
+	printversion("Console-tools", version("loadkeys -V"))
+	printversion("Dynamic linker (ldd)", version("ldd --version"))
+	printversion("E2fsprogs", version("e2fsck -V"))
 	printversion("Flex", version("flex --version"))
+	printversion("GNU AWK", version("gawk -version"))
+	printversion("GNU C", version("gcc -dumpversion"))
+	printversion("GNU make", version("make --version"))
+	printversion("GNU tar", version("tar --version"))
+	printversion("GRUB", version("grub-install --version"))
+	printversion("GRUB2", version("grub2-install --version"))
+	printversion("gtags", version("gtags --version"))
+	printversion("iptables", version("iptables -V"))
+	printversion("Isdn4k-utils", version("isdnctrl"))
+	printversion("Jfsutils", version("fsck.jfs -V"))
+	printversion("Kbd", version("loadkeys -V"))
+	printversion("kmod", version("kmod -V"))
 
 	while ("ldconfig -p 2>/dev/null" | getline > 0)
 		if ($NF ~ libc || $NF ~ libcpp)
 			if (!seen[ver = version("readlink " $NF)]++)
 				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
 
-	printversion("Dynamic linker (ldd)", version("ldd --version"))
-	printversion("Procps", version("ps --version"))
+	printversion("mcelog", version("mcelog --version"))
+	printversion("mkimage", version("mkimage --version"))
+	printversion("Module-init-tools", version("depmod -V"))
+	printversion("Mount", version("mount --version"))
 	printversion("Net-tools", version("ifconfig --version"))
-	printversion("Kbd", version("loadkeys -V"))
-	printversion("Console-tools", version("loadkeys -V"))
+	printversion("Nfs-utils", version("showmount --version"))
+	printversion("openssl", version("openssl version"))
+	printversion("pahole", version("pahole --version"))
+	printversion("Pcmcia-cs", version("cardmgr -V"))
+	printversion("Pcmciautils", version("pccardctl -V"))
+	printversion("PPP", version("pppd --version"))
+	printversion("Procps", version("ps --version"))
+	printversion("Python", version("python3 -V"))
+	printversion("Quota-tools", version("quota -V"))
+	printversion("Rust", version("rustc --version"))
 	printversion("Sh-utils", version("expr --v"))
+	printversion("Sphinx", version("sphinx-build --version"))
+	printversion("squashfs-tools", version("mksquashfs -version"))
 	printversion("Udev", version("udevadm --version"))
+	printversion("Util-linux", version("mount --version"))
 	printversion("Wireless-tools", version("iwconfig --version"))
+	printversion("Xfsprogs", version("xfs_db -V"))
 
 	while ("sort /proc/modules" | getline > 0) {
 		mods = mods sep $1
-- 
2.53.0

