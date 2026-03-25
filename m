Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807A7346A0D;
	Wed, 25 Mar 2026 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774468137; cv=none; b=AcEsbVpTPAXDHp8fqRHwgj25JrzQ2coTdeV7t9S5rSxQDkzqmr+qcrZq+MdbLO6CvZ7hrL6TfnRPGCLvreVs3LSlAm1yGAAE9Lk5BTeBWWAhZW1Y81tjZK81ZJJTtN/HulJBB8osiguK5pyRekH2VmDFhQoCdoTkNOuqYtHCSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774468137; c=relaxed/simple;
	bh=YiRp5hORkFx58+pTD1Uty4st8OKgPd7AyEupV4UQpz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBmPLjjtlWMn+NTJqhHymg17135Xca7KyRvLmCr3/CR4e0HwD6+yo2P9QWp+p74UE1IDb/lOECti+GIp3mzu1eZCrS21frrhKlODkQCV+SMgIyYONTFcs/PZUQfEeQJ8qoud0j3LyjDHXezNbaskv5VTriNb7laUhrR4oBYpP10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wpwJu42Q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X6hd1SRo; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wpwJu42Q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X6hd1SRo"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fgyC95QRBzB115;
	Wed, 25 Mar 2026 20:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774468133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3ztjrhg6iQ74avdDRyLJhlD8H9QW1fbnKgbJpR86Ls=;
	b=wpwJu42QnvZ+RmOQ9DYxN2QH2l2D2VevXqo3SuQ7kX1jQZdn3WGq5ycLK/dgHKHG+XhEUo
	vHjvOfh4rbTOvI3TwlV8G48KrCpmkpz4J8d9XacaZWYDIUAqqW18XgfrYn9xvbqepWKFnC
	y8D7E12lqd+l0t3rJhC+Lsu7k8fH3jLbaJZTdPshj0MUE3WF54wR5uzHdpBqz64UP89CO5
	oBsTZ44GmV6EcfGBVJztUZrmizg+BFzXBOvKx99sQNMjCBWwVE7rDFBgxiSZ3nLA8hAdu2
	2CiSZ/jsou10RJCTmRKSMVrsGvCgHBFVBWdwLDmAVE9lBQdgscNqdOid22fukQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=X6hd1SRo;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774468132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3ztjrhg6iQ74avdDRyLJhlD8H9QW1fbnKgbJpR86Ls=;
	b=X6hd1SRosFFQIs3KDiUAUWzH81wJ4QoZSLRIJLAU7O+7i4xIWI5sG+aI5/B+gpNzVqBQ28
	VbsT0XU9JMDA+rkId6r9G3n67VJ7d+/RWy9pEnil1uaXiIb5fK2+0zbGoU+U32/zIFREnx
	S/02WFkH28RqzSkV2cZTJwqy15EcV9WZRWJG/IkgG6GnZWSexg99mOc9Vzrxts9LyXnHka
	7voTGLn4LrIUSpgoNbUY6QfWmo0F2b4PqoW/yIeIftijxOVTFsYQqK5wR7K57TLL/pW5Zk
	es6mEBaIJnexYCFnSzeqTrVexBheXC01ADcSUsLiUcHRpaLMQ1YZoTEIPrSeaA==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v5 2/2] workflows, scripts: sort ver_linux and changes.rst
Date: Wed, 25 Mar 2026 20:48:12 +0100
Message-ID: <20260325194811.78509-2-manuelebner@mailbox.org>
In-Reply-To: <20260325194326.77923-2-manuelebner@mailbox.org>
References: <20260325194326.77923-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bf910aa68fa9af2a123
X-MBO-RS-META: fmdmwa9k1ib1r4413bci5sgebjw4w3hz
X-Rspamd-Queue-Id: 4fgyC95QRBzB115

sort output of scripts/ver_linux alphabetically
sort list in changes.rst alphabetically

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/changes.rst | 52 ++++++++++++-------------
 scripts/ver_linux                 | 64 +++++++++++++++----------------
 2 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index d94503341254..6ba9ca928e49 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -30,41 +30,41 @@ you probably do not need to concern yourself with pcmciautils.
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
-kmod                   13               kmod -V
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM (optional)  15.0.0           clang --version
 e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+gdb                    7.2              gdb --version
+GNU awk (optional)     5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+GRUB                   0.93             grub --version || grub-install --version
+gtags (optional)       6.6.5            gtags --version
+iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
-xfsprogs               2.6.0            xfs_db -V
-squashfs-tools         4.0              mksquashfs -version
-btrfs-progs            0.18             btrfs --version
+kmod                   13               kmod -V
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
-udev                   081              udevadm --version
-GRUB                   0.93             grub --version || grub-install --version
-mcelog                 0.6              mcelog --version
-iptables               1.4.2            iptables -V
-openssl & libcrypto    1.0.0            openssl version
-bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
-GNU tar                1.28             tar --version
-gtags (optional)       6.6.5            gtags --version
-mkimage (optional)     2017.01          mkimage --version
 Python                 3.9.x            python3 --version
-GNU awk (optional)     5.1.0            gawk --version
-gdb                    7.2              gdb --version
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
index fab0c68a6c52..00bdaf30d590 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -17,58 +17,58 @@ BEGIN {
 	libc = "libc[.]so[.][0-9]+$"
 	libcpp = "(libg|stdc)[+]+[.]so([.][0-9]+)+$"
 
-	printversion("GNU C", version("gcc -dumpversion"))
-	printversion("GNU make", version("make --version"))
-	printversion("binutils", version("ld -v"))
-	printversion("util-linux", version("mount --version"))
-	printversion("Mount", version("mount --version"))
-	printversion("Module-init-tools", version("depmod -V"))
-	printversion("e2fsprogs", version("e2fsck -V"))
-	printversion("jfsutils", version("fsck.jfs -V"))
-	printversion("xfsprogs", version("xfs_db -V"))
-	printversion("pcmciautils", version("pccardctl -V"))
-	printversion("Pcmcia-cs", version("cardmgr -V"))
-	printversion("quota-tools", version("quota -V"))
-	printversion("PPP", version("pppd --version"))
-	printversion("Isdn4k-utils", version("isdnctrl"))
-	printversion("nfs-utils", version("showmount --version"))
-	printversion("bison", version("bison --version"))
-	printversion("flex", version("flex --version"))
-
-	while ("ldconfig -p 2>/dev/null" | getline > 0)
-		if ($NF ~ libc || $NF ~ libcpp)
-			if (!seen[ver = version("readlink " $NF)]++)
-				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
-
-	printversion("Dynamic linker (ldd)", version("ldd --version"))
-	printversion("procps", version("ps --version"))
-	printversion("Net-tools", version("ifconfig --version"))
-	printversion("Kbd", version("loadkeys -V"))
-	printversion("Console-tools", version("loadkeys -V"))
-	printversion("Sh-utils", version("expr --v"))
-	printversion("udev", version("udevadm --version"))
-	printversion("Wireless-tools", version("iwconfig --version"))
 	printversion("bash", version("bash --version"))
 	printversion("bc", version("bc --version"))
 	printversion("bindgen", version("bindgen --version"))
+	printversion("binutils", version("ld -v"))
+	printversion("bison", version("bison --version"))
 	printversion("btrfs-progs", version("btrfs --version"))
 	printversion("Clang", version("clang --version"))
+	printversion("Console-tools", version("loadkeys -V"))
+	printversion("Dynamic linker (ldd)", version("ldd --version"))
+	printversion("e2fsprogs", version("e2fsck -V"))
+	printversion("flex", version("flex --version"))
 	printversion("gdb", version("gdb -version"))
 	printversion("GNU awk", version("gawk --version"))
+	printversion("GNU C", version("gcc -dumpversion"))
+	printversion("GNU make", version("make --version"))
 	printversion("GNU tar", version("tar --version"))
-	printversion("GRUB", version("grub-install --version"))
 	printversion("GRUB2", version("grub2-install --version"))
+	printversion("GRUB", version("grub-install --version"))
 	printversion("gtags", version("gtags --version"))
 	printversion("iptables", version("iptables -V"))
+	printversion("Isdn4k-utils", version("isdnctrl"))
+	printversion("jfsutils", version("fsck.jfs -V"))
+	printversion("Kbd", version("loadkeys -V"))
 	printversion("kmod", version("kmod -V"))
+
+	while ("ldconfig -p 2>/dev/null" | getline > 0)
+		if ($NF ~ libc || $NF ~ libcpp)
+			if (!seen[ver = version("readlink " $NF)]++)
+				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
+
 	printversion("mcelog", version("mcelog --version"))
 	printversion("mkimage", version("mkimage --version"))
+	printversion("Module-init-tools", version("depmod -V"))
+	printversion("Mount", version("mount --version"))
+	printversion("Net-tools", version("ifconfig --version"))
+	printversion("nfs-utils", version("showmount --version"))
 	printversion("openssl", version("openssl version"))
 	printversion("pahole", version("pahole --version"))
+	printversion("Pcmcia-cs", version("cardmgr -V"))
+	printversion("pcmciautils", version("pccardctl -V"))
+	printversion("PPP", version("pppd --version"))
+	printversion("procps", version("ps --version"))
 	printversion("Python", version("python3 -V"))
+	printversion("quota-tools", version("quota -V"))
 	printversion("Rust", version("rustc --version"))
+	printversion("Sh-utils", version("expr --v"))
 	printversion("Sphinx", version("sphinx-build --version"))
 	printversion("squashfs-tools", version("mksquashfs -version"))
+	printversion("udev", version("udevadm --version"))
+	printversion("util-linux", version("mount --version"))
+	printversion("Wireless-tools", version("iwconfig --version"))
+	printversion("xfsprogs", version("xfs_db -V"))
 
 	while ("sort /proc/modules" | getline > 0) {
 		mods = mods sep $1
-- 
2.53.0

