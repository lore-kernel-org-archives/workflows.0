Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43541FB1;
	Sat, 21 Feb 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771687316; cv=none; b=M613BKerxOF81q8oN45k7PYlAGXsOvbtMQ7TTLjrH7V77y+tza5uVaHpw8rWiyovrN90/0x/Lr6gBiE9HOGNfqdiaiqjA2jWo1vgGXPQTyrI5qUyPh8caHXn3z3RBUgXpstNle8rUiTehNd6MfKs3xZy3QvqkI2j6zyD2YGU2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771687316; c=relaxed/simple;
	bh=6tJjslt4k6dcumDC6VArJO1XrCBfl0Swoi1WQnvzvU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qw8J/657vUV0L14CcS7nbrFNfIzEhFHhqJ9lr7qeYXaVPWQ4d3L5VNdkPF55CD3nM55a6YhYrDhA86jEKnBA0ZmkyXN+oSNDSiI5y90D4MQ+HdfjYOwfKGCBEC5iCDKfCRZWoFkH70DZstIAWon7SEVEJO/mHrV3HK2kqQ+DxBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=fail (4096-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=AYr3GlZz reason="signature verification failed"; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="AYr3GlZz"
From: Hans Anda <hansa@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1771687301; bh=6tJjslt4k6dcumDC6VArJO1XrCBfl0Swoi1WQnvzvU4=;
	h=From:To:Cc:Subject:Date:From;
	b=AYr3GlZzYTt4XYEQWfzdgv68PWlHzltfUFDvmrl7cXtoYaWTUlOQe3Blu8GwZTc0e
	 J+V2ZG1XTPbgmXwrAf4YoHxGrxUyz/scP10iZ3BFgP/NjUoljCUkxJudCbFwDdIiw1
	 7z4a7vTun0BUE2jBKfvNVOIYUyKsQeEy456EWldwK5FVuOJ2uo/0F35jXPoLHvaGuX
	 Yba07b6by4+/Lmv5u8mb3Th6t/Hfm//iOn1ELl92+ubSqfpo6P+9jyB81rc9a94RHM
	 x3vFeKlCfkvQM04bh90U/N9mMq3ZZI5BhveA9C43XwAyvSbe7/PB6vWRXvmd8lJDik
	 WYxYkmDVmcVmw==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Anda <hansa@airmail.cc>
Subject: [PATCH] scripts: sort ver_linux and list in changes.rst
Date: Sat, 21 Feb 2026 16:21:14 +0100
Message-ID: <20260221152113.28322-2-hansa@airmail.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a pain in the ass to compare the software versions on the running
system (scripts/ver_linux) with the minimal required versions (changes.rst).

Sort both lists alphabetically
Add missing tools in ver_linux
 (bash, bc, bindgen, bindutils, btrfs, clang, e2fsck, awk, tar, gtags,
  iptables, kmod, mcelog, mkimage, openssl, pahole, python, Rust, sphinx,
  squashfs-tools, udev)
Fix minor issues (add grub2)

Signed-off-by: Hans Anda <hansa@airmail.cc>
---
 Documentation/process/changes.rst | 50 +++++++++++++--------------
 scripts/ver_linux                 | 56 +++++++++++++++++++++----------
 2 files changed, 63 insertions(+), 43 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..fb810c3710bb 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,40 +29,40 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.78.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
-GNU make               4.0              make --version
 bash                   4.2              bash --version
+bc                     1.06.95          bc --version
+bindgen (optional)     0.65.1           bindgen --version
 binutils               2.30             ld -v
-flex                   2.5.35           flex --version
 bison                  2.0              bison --version
-pahole                 1.22             pahole --version
-util-linux             2.10o            mount --version
-kmod                   13               depmod -V
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM (optional)  15.0.0           clang --version
 e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+GNU AWK (optional)     5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+grub                   0.93             grub --version || grub-install --version
+gtags (optional)       6.6.5            gtags --version
+iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
-xfsprogs               2.6.0            xfs_db -V
-squashfs-tools         4.0              mksquashfs -version
-btrfs-progs            0.18             btrfs --version
+kmod                   13               depmod -V
+mcelog                 0.6              mcelog --version
+mkimage (optional)     2017.01          mkimage --version
+nfs-utils              1.0.5            showmount --version
+openssl & libcrypto    1.0.0            openssl version
+pahole                 1.22             pahole --version
 pcmciautils            004              pccardctl -V
-quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
-nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevd --version
-grub                   0.93             grub --version || grub-install --version
-mcelog                 0.6              mcelog --version
-iptables               1.4.2            iptables -V
-openssl & libcrypto    1.0.0            openssl version
-bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
-GNU tar                1.28             tar --version
-gtags (optional)       6.6.5            gtags --version
-mkimage (optional)     2017.01          mkimage --version
 Python                 3.9.x            python3 --version
-GNU AWK (optional)     5.1.0            gawk --version
+quota-tools            3.09             quota -V
+Rust (optional)        1.78.0           rustc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+squashfs-tools         4.0              mksquashfs -version
+udev                   081              udevadm --version
+util-linux             2.10o            mount --version
+xfsprogs               2.6.0            xfs_db -V
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
diff --git a/scripts/ver_linux b/scripts/ver_linux
index d6f2362d3792..6c829448b4d4 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
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

